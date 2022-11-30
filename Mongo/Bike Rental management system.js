//This is Bike Rental management system by Atish Ojha In MongoDB

db.renter.drop();
db.client.drop();
db.rent.drop();



//create Rent collection and insert data
db.renter.insertMany([

                {_id:"1",
                username:"jash1",                
                password:"jashpas",
                Name:{First_name:"Jash", Middle_name:"Rana", Last_name:"Magar"},
                contact:"985421251",
                email:"jash@gmail.com",
                status:"1",
                
                bike:{
                bike_code:"5210",
                bike_name:"MT-15",
                specs:"Extremely tractable motor, Inverted forks have improved its handling",
                category_name:"Yamaha"},
                },
                
                
                {_id:"2",
                username:"atish1",                
                password:"atish123",
                Name:{First_name:"Atish", Middle_name: "", Last_name:"Ojha"},
                contact:"98094935",
                email:"atish@gmail.com",
                status:"1",
                
                bike:[{
                bike_code:"1423",
                bike_name:"YZF R15 V3",
                specs:"Gets segment-leading VVA and slipper clutch, Razor-sharp handling",
                category_name:"Yamaha"},
                {
                bike_code:"21542",
                bike_name:"Pulsar N160",
                specs:"The analogue pod houses the tachometer",
                category_name:"Bajaj"},
                {
                bike_code:"11490",
                bike_name:"Xtreme 160R",
                specs:"Superb suspension that smoothens bad roads",
                category_name:"Hero"},
                {
                bike_code:"140012",
                bike_name:"Pulsar NS200",
                specs:"Increase in performance despite BS6 norms",
                category_name:"Bajaj"}],
                },

                
                {_id:"3",
                username:"pawan1",                
                password:"mate123",
                Name:{First_name:"Pawan", Middle_name: "", Last_name:"Khadka"},
                contact:"9584512545",
                email:"pawan@gmail.com",
                status:"0",
                
                bike:{
                bike_code:"26501",
                bike_name:"RR 310",
                specs:"Super grippy Michelin Road 5 rubber inspires great confidence in all weather conditions",
                category_name:"TVS Apache"},
                },


                {_id:"4",
                username:"parvat1",                
                password:"launda123",
                Name:{First_name:"Parvat", Middle_name: "", Last_name:"Banjara"},
                contact:"9845125421",
                email:"jash@gmail.com",
                status:"1",
                
                bike:[{
                bike_code:"4424",
                bike_name:"RTR 160 4V",
                specs:"One of the smoothest motors out there, Offers good ride quality",
                category_name:"TVS Apache"},
                {
                bike_code:"26501",
                bike_name:"RR 310",
                specs:"Super grippy Michelin Road 5 rubber inspires great confidence in all weather conditions",
                category_name:"TVS Apache"}],
                },
                
                
                {_id:"5",
                username:"sachin1",                
                password:"khatri123",
                Name:{First_name:"Sachin", Middle_name: "", Last_name:"Khatri"},
                contact:"98564517540",
                email:"khat@gmail.com",
                status:"0",
                
                bike:[{
                bike_code:"22541",
                bike_name:"RTR 160",
                specs:"Great handling characteristics",
                category_name:"TVS Apache"},
                {
                bike_code:"12012",
                bike_name:"RTR 180",
                specs:"Razor sharp handling makes it a hoot to ride",
                category_name:"TVS Apache"}],
                }
                
                ]);
                
                
//to select data from Renter collection
db.renter.find();



//create client collection and insert data
db.client.insertMany([

                    {_id:"1",
                     client_code:"K121",
                     name:{First_name:"Ram", Middle_name: "Kumar", Last_name:"Shah"},
                     email:"ram@gmail.com",
                     contact:"02125421",
                     address:{street:"1 Tinkunay", town:"Ktm", postcode:"12014"},
                     document_id:"125421"
                     },
                     {_id:"2",
                     client_code:"M122",
                     name:{First_name:"Sham", Middle_name: "Bahadur", Last_name:"Bhatt"},
                     email:"sham@gmail.com",
                     contact:"98542120",
                     address:{street:"7 Aithpur", town:"MNR", postcode:"4010"},
                     document_id:"54215112A"
                     },
                     {_id:"3",
                     client_code:"D121",
                     name:{First_name:"Mical", Middle_name: "Kumar", Last_name:"Shubede"},
                     email:"mic@gmail.com",
                     contact:"74112421",
                     address:{street:"2 kalipul", town:"Dhn", postcode:"1400"},
                     document_id:"145412AS"
                     },
                     {_id:"4",
                     client_code:"P1420",
                     name:{First_name:"Anuj", Middle_name: "", Last_name:"Chand"},
                     email:"anju@gmail.com",
                     contact:"88954561",
                     address:{street:"3 taal", town:"POK", postcode:"45121"},
                     document_id:"47512452"
                     },
                     {_id:"5",
                     client_code:"K144",
                     name:{First_name:"Hari", Middle_name: "Dev", Last_name:"Chand"},
                     email:"hari@gmail.com",
                     contact:"45632014",
                     address:{street:"3 Haldukhal", town:"KAR", postcode:"1245740"},
                     document_id:"98563214774"
                     },
                     {_id:"6",
                     client_code:"KA124",
                     name:{First_name:"Ankit", Middle_name: "", Last_name:"Ojha"},
                     email:"ankit@gmail.com",
                     contact:"78451201",
                     address:{street:"2 Baneshwor", town:"Ktm", postcode:"12014"},
                     document_id:"12450120"
                     },
                     {_id:"7",
                     client_code:"L124",
                     name:{First_name:"Mahesh", Middle_name: "", Last_name:"Chaudhari"},
                     email:"mahe@gmail.com",
                     contact:"7542145",
                     address:{street:"5 Bhaleygau", town:"LAN", postcode:"124478"},
                     document_id:"465413514"
                     },
                     {_id:"8",
                     client_code:"K151",
                     name:{First_name:"Mohan", Middle_name: "Kumar", Last_name:"cand"},
                     email:"moho@gmail.com",
                     contact:"451788954",
                     address:{street:"1 Tinkunay", town:"Ktm", postcode:"12014"},
                     document_id:"147780023"
                     }                    
                       
                     ]);


//to find data in client
db.client.find();




db.rent.insertMany([

                   {_id:"1",
                    rent_start_date: new Date("2022-04-13"),
                    rent_end_date: new Date("2022-04-15"),
                    payment_status:"1",
                    rent_status:"1",
                    remarks:"remarks",
                    bike:{
                        $ref:"bike", $bike_code:("5210")
                         },
                    client:{
                        $ref:"client", $client_code:("K151")
                         },
                    renter:{
                        $ref:"renter", $user_id:("2")
                         },
                    payment:
                        {pay_id:"1",
                         remarks:"LATE PAID",
                         paid_by:{First_name:"Kumar", Middle_name: "", Last_name:""},
                         renter:{
                            $ref:"renter", $user_id:("1")
                             },
                         cashtype:{bill_no:"12540"}
                        }                    
                   },
                   
                   {_id:"2",
                    rent_start_date: new Date("2022-01-15"),
                    rent_end_date: new Date("2022-02-01"),
                    payment_status:"1",
                    rent_status:"1",
                    remarks:"remarks",
                    bike:{
                        $ref:"bike", $bike_code:("1423")
                         },
                    client:{
                        $ref:"client", $client_code:("P1420")
                         },
                    renter:{
                        $ref:"renter", $user_id:("1")
                         },
                    payment:
                        {pay_id:"2",
                         remarks:"PAID",
                         paid_by:{First_name:"Ram", Middle_name: "", Last_name:""},
                         renter:{
                            $ref:"renter", $user_id:("3")
                             },
                         cardtype:{card_no:"52142501A"}
                        }                    
                   },
                   
                   {_id:"3",
                    rent_start_date: new Date("2022-02-05"),
                    rent_end_date: new Date("2022-02-25"),
                    payment_status:"1",
                    rent_status:"1",
                    remarks:"Ram jee",
                    bike:{
                        $ref:"bike", $bike_code:("1423")
                         },
                    client:{
                        $ref:"client", $client_code:("K121")
                         },
                    renter:{
                        $ref:"renter", $user_id:("4")
                         },
                    payment:
                        {pay_id:"3",
                         remarks:"PAID",
                         paid_by:{First_name:"Mr Bhatt", Middle_name: "", Last_name:""},
                         renter:{
                            $ref:"renter", $user_id:("2")
                             },
                         checktype:{check_id:"212101214",
                                    name: {First_name:"Ram", Middle_name: "", Last_name:"Shing"},
                                    bank_id:"PAR11"}
                        }                    
                   },
                   
                   {_id:"4",
                    rent_start_date: new Date("2022-03-20"),
                    rent_end_date: new Date("2022-04-25"),
                    payment_status:"1",
                    rent_status:"1",
                    remarks:"Mr. bhatt",
                    bike:{
                        $ref:"bike", $bike_code:("1423")
                         },
                    client:{
                        $ref:"client", $client_code:("M122")
                         },
                    renter:{
                        $ref:"renter", $user_id:("5")
                         },
                    payment:
                        {pay_id:"4",
                         remarks:"PAID",
                         paid_by:{First_name:"Mahesh", Middle_name: "", Last_name:"Bhatt"},
                         renter:{
                            $ref:"renter", $user_id:("2")
                             },
                         mobiletype:{transfer_id:"9809493195"}
                        }                    
                   },
                   
                   {_id:"5",
                    rent_start_date: new Date("2022-04-10"),
                    rent_end_date: new Date("2022-05-20"),
                    payment_status:"1",
                    rent_status:"1",
                    remarks:"Mr. subede",
                    bike:{
                        $ref:"bike", $bike_code:("5555")
                         },
                    client:{
                        $ref:"client", $client_code:("D121")
                         },
                    renter:{
                        $ref:"renter", $user_id:("2")
                         },
                    payment:
                        {pay_id:"5",
                         remarks:"PAID",
                         paid_by:{First_name:"Mr Subee", Middle_name: "", Last_name:""},
                         renter:{
                            $ref:"renter", $user_id:("3")
                             },
                         cashtype:{bill_no:"5214"}
                        }                    
                   },
                   
                   {_id:"6",
                    rent_start_date: new Date("2022-05-25"),
                    rent_end_date: new Date("2022-07-5"),
                    payment_status:"1",
                    rent_status:"1",
                    remarks:"Mr. Ojha",
                    bike:{
                        $ref:"bike", $bike_code:("5555")
                         },
                    client:{
                        $ref:"client", $client_code:("K144")
                         },
                    renter:{
                        $ref:"renter", $user_id:("1")
                         },
                    payment:
                        {pay_id:"6",
                         remarks:"PAID",
                         paid_by:{First_name:"Hari", Middle_name: "", Last_name:"Khadka"},
                         renter:{
                            $ref:"renter", $user_id:("5")
                             },
                         Mobiletype:{transfer_id:"985642125"}
                        }                    
                   },
                   
                   {_id:"7",
                    rent_start_date: new Date("2022-06-02"),
                    rent_end_date: new Date("2022-06-03"),
                    payment_status:"0",
                    rent_status:"0",
                    remarks:"Hari sir",
                    bike:{
                        $ref:"bike", $bike_code:("26501")
                         },
                    client:{
                        $ref:"client", $client_code:("KA124")
                         },
                    renter:{
                        $ref:"renter", $user_id:("3")
                         }
                                 
                   },
                   
                   {_id:"8",
                    rent_start_date: new Date("2022-07-01"),
                    rent_end_date: new Date("2022-07-05"),
                    payment_status:"0",
                    rent_status:"0",
                    remarks:"Mahesh bhaii",
                    bike:{
                        $ref:"bike", $bike_code:("140012")
                         },
                    client:{
                        $ref:"client", $client_code:("L124")
                         },
                    renter:{
                        $ref:"renter", $user_id:("2")
                         }
                                   
                   }
                   ]);
                  
                  
                   
db.rent.find();


db.client.find({"name.First_name":"Ram"});


db.client.find({"address.street":"2 Baneshwor"});


//Query 3
//--GET DAYS OF RENTED FOR A BIKE
db.rent.aggregate([
{$project:{
         rent_start_year:"$rent_start_date",
        rent_end_year: "$rent_end_date",
        day_rented: {$subtract: [{$dayOfYear: "$rent_end_date"}, {$dayOfYear: "$rent_start_date"}]}}}
]);



//--GET TOTAL AMOUNT THAT A CLIENT HAS TO PAY FOR THEIR RENT
db.rent.aggregate([
{$project:{
        rent_start_year:"$rent_start_date",
        rent_end_year: "$rent_end_date",
        day_rented: {$subtract: [{$dayOfYear: "$rent_end_date"}, {$dayOfYear: "$rent_start_date"}]},
        get_totalamount:{$multiply:[{$subtract: [{$dayOfYear: "$rent_end_date"}, {$dayOfYear: "$rent_start_date"}]},100]}}}
]);







//Query 4

//Gives avg days of bike rented
db.rent.aggregate([
{$project:{
         rent_start_year:"$rent_start_date",
         rent_end_year: "$rent_end_date",
         bike:"$bike",
         day_rented: {$subtract: [{$dayOfYear: "$rent_end_date"}, {$dayOfYear: "$rent_start_date"}]},
//         avg_day_rented:{$avg:{$subtract: [{$dayOfYear: "$rent_end_date"}, {$dayOfYear: "$rent_start_date"}]}},
         avg_day_rented:{$divide:[{$avg:{$subtract: [{$dayOfYear: "$rent_end_date"}, {$dayOfYear: "$rent_start_date"}]}},2]}
         
}}]);




//Join Query 1

db.getCollection('rent').aggregate([
        {
            $lookup:{
            from:"client",
            localField:"_id",
            foreignField:"_id",
            as:"client_docs"
            }
        },
        {
            $lookup:{
            from:"renter",
            localField:"_id",
            foreignField:"_id",
            as:"renter_docs"
            }
        }
        ]);


























































































































