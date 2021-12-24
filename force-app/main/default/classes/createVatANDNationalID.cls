public class createVatANDNationalID {
    public static String createVat() {
        Integer X = 0, Y = 0, T = 0, C = 0;
        List<Integer> preNumber = new List<Integer>();
        String vatNumber;
        for (Integer i = 0; i < 10; i++) {
            Integer randomNumber = Integer.valueof((Math.random() * 10));
            preNumber.add(randomNumber);
            if (i == 0) {
                vatNumber = String.valueOf(randomNumber);
            } else {
                vatNumber += String.valueOf(randomNumber);
            }
        }
        for (Integer i = 0; i < 10; i++) {
            if (math.mod(i, 2) == 0) {
                X += preNumber[i];
            }
        }
        for (Integer i = 0; i < 10; i++) {
            if (math.mod(i, 2) != 0) {
                Y = preNumber[i] * 2;
                if (Y > 9) {
                    Y = Y - 9;
                }
                X += Y;
            }
        }
        T = math.mod(X, 10);
        C = math.mod((10 - T), 10);
        vatNumber += C;
        return vatNumber;
    }
    public static String charGenerator(Integer numberOfCharacters) {
        String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVXYZ';
        String randStr = '';
        String randomStr = '';
        for (Integer i = 0; i < numberOfCharacters; i++) {
            while (randStr.length() < 1) {
                Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), alphabet.length());
                randStr += alphabet.substring(idx, idx+1);
            }
            randomStr += (String) randStr;
            randStr = '';
        }
        return randomStr;
    }
    public static string numberGenerator(Integer numberOfCharacters) {
        String randomNumber = '';
        for (Integer i = 0; i < numberOfCharacters; i++) {
            Integer randNumber = Integer.valueof((Math.random() * 10));
            randomNumber += randNumber;
        }
        return randomNumber;
    }
    public static string createNationalID() {
        String value = createVatANDNationalID.charGenerator(6);
        value += createVatANDNationalID.numberGenerator(2);
        value += createVatANDNationalID.charGenerator(1);
        value += createVatANDNationalID.numberGenerator(2);
        value += createVatANDNationalID.charGenerator(1);
        value += createVatANDNationalID.numberGenerator(3);
        Map<String, Integer> oddChar = new Map<String, Integer>{
                    '0' => 1, '1' => 0, '2' => 5, '3' => 7, '4' => 9, '5' => 13,
                    '6' => 15, '7' => 17, '8' => 19, '9' => 21, 'A' => 1, 'B' => 0,
                    'C' => 5, 'D' => 7, 'E' => 9, 'F' => 13, 'G' => 15, 'H' => 17,
                    'I' => 19, 'J' => 21, 'K' => 2, 'L' => 4, 'M' => 18, 'N' => 20,
                    'O' => 11, 'P' => 3, 'Q' => 6, 'R' => 8, 'S' => 12, 'T' => 14,
                    'U' => 16, 'V' => 10, 'W' => 22, 'X' => 25, 'Y' => 24, 'Z' => 23
                };
        Map<String, Integer> evenChar = new Map<String, Integer>{
                    '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, 
                    '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'A' => 0, 'B' => 1,
                    'C' => 2, 'D' => 3, 'E' => 4, 'F' => 5, 'G' => 6, 'H' => 7, 
                    'I' => 8, 'J' => 9, 'K' => 10, 'L' => 11, 'M' => 12, 'N' => 13,
                    'O' => 14, 'P' => 15, 'Q' => 16, 'R' => 17, 'S' => 18, 'T' => 19,
                    'U' => 20, 'V' => 21, 'W' => 22, 'X' => 23, 'Y' => 24, 'Z' => 25 
                };
        Map<Integer, String> remainder = new Map<Integer, String>{
                    0 => 'A', 1 => 'B', 2 => 'C', 3 => 'D', 4 => 'E', 5 => 'F',
                    6 => 'G', 0 => 'A', 1 => 'B', 2 => 'C', 3 => 'D', 4 => 'E',
                    5 => 'F', 6 => 'G', 7 => 'H', 8 => 'I', 9 => 'J', 10 => 'K',
                    11 => 'L', 12 => 'M', 13 => 'N', 14 => 'O', 15 => 'P', 16 => 'Q',
                    16 => 'Q', 17 => 'R', 18 => 'S', 19 => 'T', 20 => 'U', 21 => 'V',
                    22 => 'W', 23 => 'X', 24 => 'Y', 25 => 'Z'
                };
        List<String> strlist = value.split('');
        Integer sumOdd = 0, sumEven = 0;
        for (Integer i = 0; i < 16; i+=2) {
            for (String listOdd : oddChar.keyset()) {
                if (listOdd == strList[i]) {
                    sumOdd += (Integer) oddChar.get(listOdd);
                }
            }
        }
        for (Integer i = 1; i < 15; i += 2) {
            for (String listEven : evenChar.keyset()) {
                if (listEven == strList[i]) {
                    sumEven += (Integer) evenChar.get(listEven);
                }
            }
        }
        Integer mod = math.mod((sumOdd + sumEven), 26);
        for (Integer rem : remainder.keyset()) {
            if (mod == rem) {
                value += remainder.get(rem);
            }
        }
        return value;
    }
}