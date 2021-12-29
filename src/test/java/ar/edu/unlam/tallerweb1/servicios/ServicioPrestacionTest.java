package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.modelo.*;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioPrestacion;
import static org.assertj.core.api.Assertions.assertThat;

import ar.edu.unlam.tallerweb1.repositorios.RepositorioUsuario;
import org.assertj.core.api.Assertions;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class ServicioPrestacionTest {
    private static final Long MECANICO = 638L;
    private static final Long CLIENTE = 201L;

    private Usuario cliente;
    private Usuario asistente;
    private Especialidad especialidad;
    private Prestacion prestacion;

    @Mock
    private RepositorioPrestacion repositorioPrestacion;
    @Mock
    private RepositorioUsuario repositorioUsuario;
    @Mock
    private ServicioPrestacion servicioPrestacion;

    private final Prestacion prestacionCONTRATADA = getContratado();

    private Prestacion getContratado(){
        Prestacion prestacionContratada = new Prestacion();
        return prestacionContratada;
    }

    private RepositorioPrestacion repositorioContratar = Mockito.mock(RepositorioPrestacion.class);
    private ServicioPrestacionImpl servicioContratar = new ServicioPrestacionImpl(repositorioContratar, repositorioUsuario);

    @Before
    public void init(){
        MockitoAnnotations.initMocks(this);
        this.servicioPrestacion = new ServicioPrestacionImpl(repositorioPrestacion,repositorioUsuario);
    }


    @Test
    public void prestacionServicioExitoso() {
        givenPrestacionServicioExitosoDisponible();
        whenPrestacionServicioExitosoContratoPrestacion();
        thenPrestacionServicioExitosoContratacionExitosa();
    }

    @Test
    public void queDevuelvaLosContratados(){
        givenContratado();
        whenBuscoLaListaDeContratados(prestacionCONTRATADA);
        thenVeoElSizeDeContratado(1);
    }

    @Test
    public void queEjecuteMetodoSave(){
        givenContratado();
        whenEjecutoMetodoSave(prestacionCONTRATADA);
        thenVeoLaCantidadDeEjecuciones(1);
    }

    @Test
    public void queSeEjecuteFindById(){
        givenContratado();
        whenEjecutoMetodoFindById(1l, prestacionCONTRATADA);
        thenAnalizoElContradoSeaIgualAlQueEspero(1L, prestacionCONTRATADA);
    }

    @Test
    public void finalizarConExitoUnaPrestacion() throws Exception {
       Prestacion prestacionActiva = givenUnaPrestacionActiva();
        whenFinalizaLaPrestacion(prestacionActiva);
        thenVerificarQueLaPrestacionNoEstaActiva();
    }

    @Test (expected = Exception.class)
    public void finalizarUnaPrestacionQueYaEstaFinalizadaDaError() throws Exception {
       Prestacion prestacionFinalizada=  givenUnaPrestacionFinalizada();
        whenFinalizoUnaPrestacionQueYaEstabaFinalizada(prestacionFinalizada);
    }

    @Test
    public void listaElHistorialDePrestacionesDeUnUsuarioOrdenadoPorEstadoActivoFinalizadoCancelado() {
        givenUsuarioConUnaPrestacionPorEstado(CLIENTE);
        var prestaciones = whenBuscoLasPrestacionesDelUsuario(CLIENTE);
        thenComprueboQueLaListaEstaOrdenadaPorActivaFinalizadaCancelada(prestaciones);
    }

    @Test
    public void clienteCalificaPrestacionFinalizadaSinCalificar() throws Exception {
        givenUnaPrestacionFinalizadaSinCalificar(1l);
        whenClienteCalificaPrestacionFinalizada(1l,5);
        thenVerficoQueSellamoAlMetodoCalificarDelRepositorioPrestacion();
    }

    @Test (expected = Exception.class)
    public  void clienteIntentaCalificarPrestacionActiva() throws Exception {
       Prestacion prestacion = givenUnaPrestacionActiva();
       whenClienteIntentaCalificarPrestacionActiva(prestacion.getId(),5);

    }
    @Test (expected = Exception.class)
    public  void clienteCalificaPrestacionConUnValorQueNoEstaDentroDelRango() throws Exception {
        givenUnaPrestacionFinalizadaSinCalificar(1l);
        whenClienteCalificaConUnValorIncorrecto(1l,0);
    }

    @Test
    public void mostrarPromedioDeCalificacionDeUsuarioFinal() throws Exception {
        Usuario usuario =new Usuario();
        usuario.setId(20l);
        Float promedioEsperado = givenIdDeUnUsuarioConCalificaciones(usuario);
        Float promedioObtenido = whenSeObtienePromedioDeCalificacion(usuario);
        thenSeMuestraCalificacionEsperada(promedioEsperado,promedioObtenido,usuario.getId());
    }

    @Test(expected = Exception.class)
    public void alQuererMostrarPromedioDeCalificacionDeUsuarioFinalLaListaVieneVacia() throws Exception {
        Usuario usuario =new Usuario();
        usuario.setId(20l);

        givenIdDeUnUsuarioSinCalificaciones(usuario);
        whenSeObtienePromedioDeCalificacion(usuario);
    }

    @Test
    public void usuarioFinalCancelaUnaPrestacionActivaExitosamente() throws Exception {
        Prestacion prestacion = givenUnaPrestacionActivaDeUnCliente();
        whenUsuarioFinalCancelaUnaPrestacionActiva(prestacion);
        thenCancelaExitosamenteConMetodoUpdate(prestacion);
    }

    @Test (expected= Exception.class)
    public void usuarioFinalIntentaCancelarUnaPrestacionYaFinalizada() throws Exception {
        Prestacion prestacion = givenUnaPrestacionFinalizadaDeUnCliente();
        whenUsuarioFinalIntentaCancelarUnaPrestacionYaFinalizada(prestacion);
    }

    private void whenUsuarioFinalIntentaCancelarUnaPrestacionYaFinalizada(Prestacion prestacion) throws Exception {
        servicioPrestacion.cancelarPrestacionActiva(prestacion);
    }

    private Prestacion givenUnaPrestacionFinalizadaDeUnCliente() {
        Prestacion prestacion = new Prestacion();
        prestacion.setEstado("finalizado");
        prestacion.setId(1l);
        prestacion.setUsuarioSolicitante(this.cliente);
        return prestacion;
    }

    private void thenCancelaExitosamenteConMetodoUpdate(Prestacion prestacion) {
        verify(repositorioPrestacion,times(1)).update(prestacion);
    }

    private Prestacion givenUnaPrestacionActivaDeUnCliente() {
        Prestacion prestacion = new Prestacion();
        prestacion.setEstado("activo");
        prestacion.setId(1l);
        prestacion.setUsuarioSolicitante(this.cliente);
        return prestacion;
    }

    private void whenUsuarioFinalCancelaUnaPrestacionActiva(Prestacion prestacion) throws Exception {
        servicioPrestacion.cancelarPrestacionActiva(prestacion);
    }


    private void givenIdDeUnUsuarioSinCalificaciones(Usuario usuario) {
        when(repositorioPrestacion.buscarPrestacionesCalificadasPorUsuario(usuario.getId())).thenReturn(anyList());
    }

    private void thenSeMuestraCalificacionEsperada(Float promedioEsperado, Float promedioObtenido,Long idUsuario) {
        assertThat(promedioObtenido).isEqualTo(promedioEsperado);
        verify(repositorioPrestacion,times(1)).buscarPrestacionesCalificadasPorUsuario(idUsuario);
    }

    private Float whenSeObtienePromedioDeCalificacion(Usuario usuario) throws Exception {
        return servicioPrestacion.obtenerPromedioDeCalificicacionDeUnUsuario(usuario);
    }

    private Float givenIdDeUnUsuarioConCalificaciones(Usuario usuario) {
        List<Prestacion>listaPrestaciones = new ArrayList<>();

        Float promedio = 0f;
        Integer sumatoria = 0;

        for (int i=1;i<=5;i++){
            Random r = new Random();
            Integer valorDado = r.nextInt(4)+1;
            Prestacion prestacion = new Prestacion();
            prestacion.setUsuarioSolicitante(usuario);
            prestacion.setCalificacionDadaPorUsuarioAsistente(valorDado);
            sumatoria+=valorDado;
            listaPrestaciones.add(prestacion);
        }

        when(repositorioPrestacion.buscarPrestacionesCalificadasPorUsuario(usuario.getId())).thenReturn(listaPrestaciones);
        return promedio= sumatoria.floatValue()/listaPrestaciones.size();
    }

    public void whenClienteCalificaConUnValorIncorrecto (Long idPrestacion, Integer calificacion) throws Exception {
        servicioPrestacion.ClienteCalificaPrestacion(idPrestacion,calificacion);
    }

    private void whenClienteIntentaCalificarPrestacionActiva(Long idPrestacion, Integer calificacion) throws Exception {
        servicioPrestacion.ClienteCalificaPrestacion(idPrestacion,calificacion);
    }

    private void thenVerficoQueSellamoAlMetodoCalificarDelRepositorioPrestacion() {
        verify(repositorioPrestacion,times(1)).update(anyObject());
    }

    private void givenUnaPrestacionFinalizadaSinCalificar(Long idPrestacion) {
        Prestacion prestacion = new Prestacion();
        prestacion.setEstado("finalizado");
        prestacion.setId(idPrestacion);
        prestacion.setCalificacionDadaPorElCliente(null);
        when(repositorioPrestacion.buscarPrestacionFinalizadaSinCalificar(idPrestacion)).thenReturn(prestacion);
    }

    private void whenClienteCalificaPrestacionFinalizada(Long idPrestacion, Integer calificacion) throws Exception {
        servicioPrestacion.ClienteCalificaPrestacion(idPrestacion,calificacion);
    }

    private void whenFinalizoUnaPrestacionQueYaEstabaFinalizada(Prestacion prestacionFinalizada) throws Exception {
        servicioContratar.finalizarPrestacion(prestacionFinalizada);
    }

    private Prestacion givenUnaPrestacionFinalizada() {
        Prestacion prestacion = new Prestacion();
        prestacion.setEstado("finalizado");
        return prestacion;
    }

    private void thenVerificarQueLaPrestacionNoEstaActiva() {
        verify(repositorioContratar,times(1)).update(anyObject());
    }

    private void whenFinalizaLaPrestacion(Prestacion prestacion) throws Exception {
        servicioContratar.finalizarPrestacion(prestacion);
    }

    private Prestacion givenUnaPrestacionActiva() {
        Prestacion prestacion = new Prestacion();
        prestacion.setEstado("activo");
        return prestacion;
    }

    private void givenContratado() {
    }

    private void whenBuscoLaListaDeContratados(Prestacion prestacionContratada) {
        Mockito.when(repositorioPrestacion.getAll()).thenReturn(Stream.of(prestacionContratada).collect(Collectors.toList()));
    }

    private void thenVeoElSizeDeContratado(Integer count) {
        assertThat(servicioPrestacion.getAll().size()).isEqualTo(count);
    }

    private void whenEjecutoMetodoSave(Prestacion prestacionContratada) {
        servicioPrestacion.save(prestacionContratada);
    }

    private void thenVeoLaCantidadDeEjecuciones(int i) {
        Mockito.verify(repositorioPrestacion,Mockito.times(i)).save(prestacionCONTRATADA);
    }

    private void whenEjecutoMetodoFindById(long l, Prestacion prestacionContratada) {
        Mockito.when(repositorioPrestacion.prestacionFindById(l)).thenReturn(prestacionContratada);
    }

    private void thenAnalizoElContradoSeaIgualAlQueEspero(long l, Prestacion prestacionContratada) {
        assertThat(servicioPrestacion.prestacionFindById(l)).isEqualTo(prestacionContratada);
    }


    private void givenPrestacionServicioExitosoDisponible() {
        cliente = new Usuario();

        var rolCliente = new Rol();
        rolCliente.setId(CLIENTE);

        cliente.setRol(rolCliente);

        asistente = new Usuario();

        var rolMecanico = new Rol();
        rolMecanico.setId(MECANICO);

        asistente.setRol(rolMecanico);

        especialidad = new Especialidad();

        prestacion = new Prestacion();

        prestacion.setUsuarioSolicitante(cliente);
        prestacion.setUsuarioAsistente(asistente);
        prestacion.setEspecialidad(especialidad);
    }

    private void whenPrestacionServicioExitosoContratoPrestacion() {
        servicioContratar.save(prestacion);
    }

    private void thenPrestacionServicioExitosoContratacionExitosa() {
        Assertions.assertThat(servicioContratar.prestacionFindById(prestacion.getId()));
    }

    private void givenUsuarioConUnaPrestacionPorEstado(Long id) {
        final var prestaciones = new ArrayList<Prestacion>();

        final var cancelada = new Prestacion();
        cancelada.setEstado(PrestacionEstado.CANCELADA.getEstado());
        prestaciones.add(cancelada);

        final var activa = new Prestacion();
        activa.setEstado(PrestacionEstado.ACTIVO.getEstado());
        prestaciones.add(activa);

        final var finalizado = new Prestacion();
        finalizado.setEstado(PrestacionEstado.FINALIZADO.getEstado());
        prestaciones.add(finalizado);

        Mockito.when(repositorioPrestacion.listarPrestacionesContratadasPorCliente(id)).thenReturn(prestaciones);
    }

    private List<Prestacion> whenBuscoLasPrestacionesDelUsuario(Long id) {
        return servicioPrestacion.listarPrestacionesContratadasPorCliente(id);
    }

    private void thenComprueboQueLaListaEstaOrdenadaPorActivaFinalizadaCancelada(List<Prestacion> prestaciones) {
        Assertions.assertThat(prestaciones).isNotEmpty();
        Assertions.assertThat(prestaciones.get(0).getEstado()).isEqualToIgnoringCase(PrestacionEstado.ACTIVO.getEstado());
        Assertions.assertThat(prestaciones.get(1).getEstado()).isEqualToIgnoringCase(PrestacionEstado.FINALIZADO.getEstado());
        Assertions.assertThat(prestaciones.get(2).getEstado()).isEqualToIgnoringCase(PrestacionEstado.CANCELADA.getEstado());
    }

}
