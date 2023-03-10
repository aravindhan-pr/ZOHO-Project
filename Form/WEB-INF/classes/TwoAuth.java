import java.io.*;
import java.security.*;
import java.net.*;
import org.apache.commons.codec.binary.Base32;
import org.apache.commons.codec.binary.Hex;
import de.taimos.totp.TOTP;

public class TwoAuth{
        public static String generateSecretKey() {
                SecureRandom random = new SecureRandom();
                byte[] bytes = new byte[20];
                random.nextBytes(bytes);
                Base32 base32 = new Base32();
                return base32.encodeToString(bytes);
        }
        public static String getTOTPCode(String secretKey) {
            Base32 base32 = new Base32();
            byte[] bytes = base32.decode(secretKey);
            String hexKey = Hex.encodeHexString(bytes);
            return TOTP.getOTP(hexKey);
        }
       
        
         
           
}