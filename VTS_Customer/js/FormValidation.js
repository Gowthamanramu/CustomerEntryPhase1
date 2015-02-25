
   //Function for textbox accept only numbers
        function validate(key) 
        {
            //getting key code of pressed key
            var keycode = (key.which) ? key.which : key.keyCode;
            //comparing pressed keycodes
            if (!(keycode == 8 || keycode == 43) && (keycode < 48 || keycode > 57))
             {
                return false;
            }
        }
// Function for textbox Accept only alphabets 
        function isAlphaKey(evt)
         {
             var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 46 && (charCode < 33 || charCode > 65) && (charCode < 91 || charCode > 95) && (charCode < 123 || charCode > 126))
                return true;
            else
                return false;
        }


        /*  Date Picker */

        $(function () {

            $("#txtDob").datepicker({ dateFormat: 'd MM, yy',
                changeMonth: true,
                changeYear: true
            });

        });

