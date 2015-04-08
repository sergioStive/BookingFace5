/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.sena.edu.booking.DAO;


import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Sena
 */
public class reserDAOTest {
    
    public reserDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of actualizarRegistro method, of class reserDAO.
     */
//    @Test
//    public void testActualizarRegistro() {
//        System.out.println("actualizarRegistro");
//        reserDTO resert = null;
//        reserDAO instance = new reserDAO();
//        String expResult = "";
//        String result = instance.actualizarRegistro(resert);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of actualizarReserva method, of class reserDAO.
//     */
//    @Test
//    public void testActualizarReserva() {
//        System.out.println("actualizarReserva");
//        reserDTO resert = null;
//        reserDAO instance = new reserDAO();
//        String expResult = "";
//        String result = instance.actualizarReserva(resert);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of eliminar method, of class reserDAO.
     */
    @Test
    public void testEliminar() {
      System.out.println("eliminarReserva");
      int idReserva = 2343433;
      reserDAO instance = new reserDAO();
      String expResult = "reserva eliminada";
      String result = instance.eliminar(idReserva);
      assertEquals(null,expResult, result);
      // TODO review the generated test code and remove the default call to fail.
      //fail("The test case is a prototype.");
    }
    
   
    /**
     * Test of insertar method, of class reserDAO.
     */
//    @Test
//    public void testInsertar() throws Exception {
//        System.out.println("insertar");
//        reserDTO rdto = null;
//        reserDAO instance = new reserDAO();
//        String expResult = "";
//        String result = instance.insertar(rdto);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of listarReservas method, of class reserDAO.
//     */
//    @Test
//    public void testListarReservas() throws Exception {
//        System.out.println("listarReservas");
//        reserDAO instance = new reserDAO();
//        List<reserDTO> expResult = null;
//        List<reserDTO> result = instance.listarReservas();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of Paginacion method, of class reserDAO.
//     */
//    @Test
//    public void testPaginacion() throws Exception {
//        System.out.println("Paginacion");
//        int pg = 0;
//        int limited = 0;
//        reserDAO instance = new reserDAO();
//        List<reserDTO> expResult = null;
//        List<reserDTO> result = instance.Paginacion(pg, limited);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of ListarUnaReserva method, of class reserDAO.
//     */
//    @Test
//    public void testListarUnaReserva() throws Exception {
//        System.out.println("ListarUnaReserva");
//        int idReserva = 0;
//        reserDAO instance = new reserDAO();
//        reserDTO expResult = null;
//        reserDTO result = instance.ListarUnaReserva(idReserva);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getHTMLAll method, of class reserDAO.
//     */
//    @Test
//    public void testGetHTMLAll() throws Exception {
//        System.out.println("getHTMLAll");
//        String Id = "";
//        reserDAO instance = new reserDAO();
//        String expResult = "";
//        String result = instance.getHTMLAll(Id);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of contarRegistros method, of class reserDAO.
//     */
//    @Test
//    public void testContarRegistros() {
//        System.out.println("contarRegistros");
//        reserDAO instance = new reserDAO();
//        int expResult = 0;
//        int result = instance.contarRegistros();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
    
}
