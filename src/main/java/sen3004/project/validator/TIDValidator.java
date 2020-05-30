package sen3004.project.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import sen3004.project.model.Patient;
import sen3004.project.service.WebService;

@Component
public class TIDValidator implements Validator {

    //// Properties
    // References
    private WebService service;

    //// Constructors
    // Parametric
    public TIDValidator(WebService service){
        this.service = service;
    }

    //// Methods
    // Validator implementation
    @Override
    public boolean supports(Class<?> clazz) {
        return Patient.class.isAssignableFrom(clazz);
    }
    @Override
    public void validate(Object target, Errors errors) {
        long TID = ((Patient) target).getTID();
        
        // TID has a unique constraint
        if (service.patientExistsByTID(TID)){
            errors.rejectValue("TID", "TID.custom.exists");
        }

        // TID is a 11 digit number
        if ((int) Math.log10(TID) == 10){
            int[] digits = getDigitsOfLong(TID);

            // First 10 digits of TID gives 11th digit of TID
            int sumOfFirstTen = digits[0] + digits[1] + digits[2] + digits[3] +
                                digits[4] + digits[5] + digits[6] + digits[7] +
                                digits[8] + digits[9];
            if (lastDigitOf(sumOfFirstTen) == digits[10]){

                // 10th digit must be the first digit of
                // Sum of 7 times the sum of digits 1, 3, 5, 7 and 9 and
                // 9 times the sum of digits 2, 4, 6 and 8
                int sumOfOdds = digits[0] + digits[2] + digits[4] + digits[6] + digits[8];
                int sumOfEvens = digits[1] + digits[3] + digits[5] + digits[7];
                if (lastDigitOf((7 * sumOfOdds) + (9 * sumOfEvens)) == digits[9]){

                    // Finally, first digit of 
                    // 8 times the sum of digits 1, 3, 5, 7 and 9 
                    // must give the 11th digit
                    if (lastDigitOf(8 * sumOfOdds) == digits[10]) return;
                }
            }
        }

        // Exit: invalid
        errors.rejectValue("TID", "TID.custom.invalid");
    }
    // Utility
    private int[] getDigitsOfLong(long number){
        char[] parsed = Long.toString(number).toCharArray();
        int[] digits = new int[parsed.length];
        for (int i = 0; (i < parsed.length); i++){
            digits[i] = Character.getNumericValue(parsed[i]);
        }
        return digits;
    }
    private int lastDigitOf(int number){
        String parsed = String.valueOf(number);
        char last = parsed.charAt(parsed.length() - 1);
        return Character.getNumericValue(last);
    }

}