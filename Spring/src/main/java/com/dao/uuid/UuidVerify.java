package com.dao.uuid;

import java.util.UUID;

import org.junit.Assert;
import org.junit.Test;

public class UuidVerify {
	
	@Test
	public void verifyUUIDBytesCanBeReconstructedBackToOriginalUUID() {
	  UUID u = UUID.randomUUID();
	  byte[] uBytes = UuidUtils.asBytes(u);
	  UUID u2 = UuidUtils.asUuid(uBytes);
	  Assert.assertEquals(u, u2);
	}

	@Test
	public void verifyNameUUIDFromBytesMethodDoesNotRecreateOriginalUUID() {
	  UUID u = UUID.randomUUID();
	  byte[] uBytes = UuidUtils.asBytes(u);
	  UUID u2 = UUID.nameUUIDFromBytes(uBytes);
	  Assert.assertNotEquals(u, u2);
	} 
	
}
