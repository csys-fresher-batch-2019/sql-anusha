# ABC Hospital

## Table 1 : Departments

| DEPARTMENT_ID | DEPARTMENT_NAME  |
|---------------|------------------|
| 1             | Cardiology       |
| 2             | Dermatology      |
| 3             | Pediatrician     |
| 4             | General Medicine |
| 5             | ENT              |
| 6             | Dental           |

## Table 2 : Doctors

| DOCTOR_ID | DOCTOR_NAME | DEPARTMENT_ID | D_POSITION         |
|-----------|-------------|---------------|--------------------|
| 1         | a           | 4             | HEAD OF DEPARTMENT |
| 2         | b           | 1             | HEAD OF DEPARTMENT |
| 3         | c           | 4             | DOCTOR             |
| 4         | d           | 2             | HEAD OF DEPARTMENT |
| 5         | e           | 5             | HEAD OF DEPARTMENT |
| 6         | f           | 6             | HEAD OF DEPARTMENT |
| 7         | g           | 6             | DOCTOR             |
| 8         | h           | 3             | HEAD OF DEPARTMENT |
| 9         | i           | 4             | DOCTOR             |
| 10        | j           | 1             | DOCTOR             |

## Table 3 : Patient
| PATIENT_ID | PATIENT_NAME | AGE | WEIGHT | GENDER | ADDRESS               | PHONE_NUMBER | DISEASE          | DOCTOR_ID | ENTRY_DATE | PATIENT_TYPE |
|------------|--------------|-----|--------|--------|-----------------------|--------------|------------------|-----------|------------|--------------|
| 1          | z            | 34  | 54     | F      | jksg12yu              | 9182656261   | ALLERGY          | 4         | 01-JAN-20  | IN           |
| 2          | y            | 27  | 75     | M      | nfbh ruyf7            | 3648573489   | GENERAL CHECK-UP | 9         | 02-JAN-20  | OUT          |
| 3          | x            | 10  | 38     | M      | jkrh wguitj4hh        | 2768756868   | TOOTH ACHE       | 6         | 01-JAN-20  | OUT          |
| 4          | w            | 3   | 10     | M      | jehtu irgfuruih       | 9858876451   | FEVER            | 8         | 01-JAN-20  | IN           |
| 5          | v            | 60  | 79     | M      | h8945ty7 845yhgui45hv | 9754873675   | CARDIAC ARREST   | 10        | 01-JAN-20  | IN           |
| 6          | u            | 19  | 44     | F      | uc4t78 4gjkbtc85      | 823697765    | HEAD ACHE        | 3         | 01-JAN-20  | OUT          |
| 7          | t            | 33  | 77     | F      | hx43gr7 cg34ug        | 9768854783   | CAVITY           | 6         | 01-JAN-20  | OUT          |
| 8          | s            | 22  | 55     | M      | 4837ucb               | 6756478657   | HEARING LOSS     | 5         | 01-JAN-20  | OUT          |
| 9          | r            | 98  | 70     | F      | c84b5u8 bg45u         | 3847567867   | COMMON COLD      | 1         | 01-JAN-20  | OUT          |
| 10         | q            | 45  | 68     | M      | h8t2c45 ucbutg2i      | 834564657    | ATHEROSCLEROSIS  | 2         | 01-JAN-20  | IN           |

## Table 4 : Appointment
|APPOINTMENT_ID|	PATIENT_ID	|PURPOSE	DOCTOR_ID|	S_TIME	                    |           E_TIME           |
|--------------|--------------|------------------|------------------------------|----------------------------|
|1	           |2	            | hefbj	 9	       | 03-JAN-20 02.39.17.000000 AM	|03-JAN-20 02.59.27.000000 AM|
|2	           |3	            | hefbj	 6	       | 03-JAN-20 02.39.17.000000 AM	|03-JAN-20 02.59.27.000000 AM|

## Table 5 : Lab

| LAB_NO | PATIENT_ID | AMOUNT | RESULT_DATE | RESULTS |
|--------|------------|--------|-------------|---------|
| 1      | 1          | 90     | 02-JAN-20   | fdtyfh  |
| 2      | 3          | 150    | 01-JAN-20   | mjgjfyu |
| 3      | 5          | 420    | 30-DEC-19   | csvcx   |
| 4      | 2          | 99     | 28-DEC-19   | jgddddd |

## Table 6 : Nurse

|NURSE_ID	|NURSE_NAME	|N_POSITION        |
|---------|-----------|------------------|
|1	      |q	        |HEAD OF DEPARTMENT|
|2        |w          |NURSE             |
|3	      |e	        |NURSE             |
|4	      |r	        |NURSE             |
|5	      |t	        |NURSE             |

## Table 7 : Rooms

| ROOM_ID | NURSE_ID | PATIENT_ID |
|---------|----------|------------|
| 1       | 1        | 1          |
| 2       | 2        | 4          |
| 3       | 3        | 5          |
| 4       | 4        | 10         |
| 5       | 5        |  -         |
| 6       | 6        |  -         |
| 7       | 7        |  -         |
| 8       | 8        |  -         |
| 9       | 9        |  -         |
| 10      | 10       |  -         |

## Table 8 : Bills

| BILL_NO | PATIENT_ID | TOTAL_AMOUNT | AMOUNT_PAID | PENDING_AMOUNT | BILL_DATE | STATUS |
|---------|------------|--------------|-------------|----------------|-----------|--------|
| 1       | 2          | 3234         | 543         | 2691           | 03-JAN-20 | UNPAID |
| 2       | 4          | 1200         | 1200        | 0              | 03-JAN-20 | PAID   |
| 3       | 6          | 3670         | 2734        | 936            | 03-JAN-20 | UNPAID |
| 4       | 7          | 7653         | 5443        | 2210           | 03-JAN-20 | UNPAID |
| 5       | 9          | 3234         | 3234        | 0              | 03-JAN-20 | PAID   |
| 6       | 1          | 8942         | 8942        | 0              | 03-JAN-20 | PAID   |
| 7       | 3          | 8978         | 543         | 8435           | 03-JAN-20 | UNPAID |
| 8       | 5          | 75341        | 75341       | 0              | 03-JAN-20 | PAID   |
| 9       | 10         | 8637         | 5632        | 3005           | 03-JAN-20 | UNPAID |
| 10      | 8          | 6532         | 6532        | 0              | 03-JAN-20 | PAID   |
