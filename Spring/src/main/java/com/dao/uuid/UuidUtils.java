package com.dao.uuid;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.UUID;

public class UuidUtils {
	
	  public static UUID asUuid(byte[] bytes) {
	    ByteBuffer bb = ByteBuffer.wrap(bytes);
	    long firstLong = bb.getLong();
	    long secondLong = bb.getLong();
	    return new UUID(firstLong, secondLong);
	  }
	  
	  public static byte[] asBytes(UUID uuid) {
	    ByteBuffer bb = ByteBuffer.wrap(new byte[16]);
	    bb.putLong(uuid.getMostSignificantBits());
	    bb.putLong(uuid.getLeastSignificantBits());
	    return bb.array();
	  }
	  
	  public static byte[] UUID_TO_BIN(UUID uuid) {
		  //UUID uuid = UUID.randomUUID();
		  byte[] uuidBytes = new byte[16];
		  ByteBuffer.wrap(uuidBytes)
		          .order(ByteOrder.BIG_ENDIAN)
		          .putLong(uuid.getMostSignificantBits())
		          .putLong(uuid.getLeastSignificantBits());
		  return uuidBytes;
	  }
}
