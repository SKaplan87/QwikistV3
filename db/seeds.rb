# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name:"Scott Kaplan",email:"scottkaplan.sk@gmail.com",password:"123456")
Gym.create(name:"The Marc",address:"260 W 54th St, New York, NY",bio:"Apartment Building Gym",fee:0,user_id:1)
Gym.create(name:"241 5th",address:"241 5th Ave, New York, NY",bio:"Apartment Building Gym",fee:0,user_id:1)
Client.create(name:"Paul George",address:"260 W 54th St, New York, NY",email:"Paul@email.com",img:"",user_id:1)
Client.create(name:"Marc Brookman",address:"260 W 54th St, New York, NY",email:"Marc@email.com",img:"",user_id:1)
Client.create(name:"Jim Tracey",address:"260 W 54th St, New York, NY",email:"Jim@email.com",img:"",user_id:1)
Client.create(name:"Henry Meyerberg",address:"241 5th Ave, New York, NY",email:"Henry@email.com",img:"",user_id:1)

Agreement.create(user_id:1,client_id:1,fee:75)
Agreement.create(user_id:1,client_id:2,fee:100)
Agreement.create(user_id:1,client_id:3,fee:100)
Agreement.create(user_id:1,client_id:4,fee:120)
Agreement.create(user_id:1,client_id:5,fee:50)
Workout.create(agreement_id:1,gym_id:1,date:"2017-5-23",time:"7:30",user_id:1)
Workout.create(agreement_id:1,gym_id:1,date:"2017-5-24",time:"7:00",user_id:1)
Workout.create(agreement_id:1,gym_id:1,date:"2017-5-25",time:"7:30",user_id:1)
Workout.create(agreement_id:1,gym_id:1,date:"2017-5-26",time:"8:00",user_id:1)
Workout.create(agreement_id:2,gym_id:1,date:"2017-5-23",time:"6:30",user_id:1)
Workout.create(agreement_id:2,gym_id:1,date:"2017-5-25",time:"6:30",user_id:1)
Workout.create(agreement_id:4,gym_id:2,date:"2017-5-24",time:"19:15",user_id:1)


