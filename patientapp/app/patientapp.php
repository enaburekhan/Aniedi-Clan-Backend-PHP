<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class patientapp extends Model
{
    protected $fillable = [
        'patiend_id', 'user_id', 'title','patient_fullname', 'gender', 'genotype', 'marital_status',
        'birth_date', 'email', 'password','address','state', 'country', 'phone', 'admission_date', 'discharged_date', 'hmo_card_no', 
        'purpose', 'photo', 'doctor_id', 'hmo_id', 'hmo_name', 'status', 'time_in'
    ];
}
