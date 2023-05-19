package com.skilldistillery.skyreport.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class LocationTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Location location;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("CoastToCoastSkyReport");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		location = em.find(Location.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		location = null;
	}

	@Test
	void test() {
		assertNotNull(location);
		assertNotNull(location.getCity());
		assertEquals("Nellis AFB", location.getCity());
	}
	
	@Test
	void test_Location_User_mapping() {
		assertNotNull(location);
		assertNotNull(location.getUser());
		assertEquals("John", location.getUser().getFirstName());
	}
		
	@Test
	void test_Location_Sighting_mapping() {
		location = em.find(Location.class, 2);
		assertNotNull(location);
		assertNotNull(location.getSighting());
		assertEquals(1, location.getSighting().getId());
	}
	

}
