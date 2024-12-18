{
  "$GMObject":"",
  "%Name":"obj_goblin",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":1,"eventType":2,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":1,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_goblin",
  "overriddenProperties":[],
  "parent":{
    "name":"Objects",
    "path":"folders/Objects.yy",
  },
  "parentObjectId":null,
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[
    {"x":0.0,"y":0.0,},
    {"x":48.0,"y":0.0,},
    {"x":48.0,"y":48.0,},
    {"x":0.0,"y":48.0,},
  ],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"gold_sniffing_range","filters":[],"listItems":[],"multiselect":false,"name":"gold_sniffing_range","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"150","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemy_speed","filters":[],"listItems":[],"multiselect":false,"name":"enemy_speed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"2","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"damage","filters":[],"listItems":[],"multiselect":false,"name":"damage","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"health","filters":[],"listItems":[],"multiselect":false,"name":"health","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"aggro_range","filters":[],"listItems":[],"multiselect":false,"name":"aggro_range","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"state","filters":[],"listItems":[],"multiselect":false,"name":"state","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"wander_timer_min","filters":[],"listItems":[],"multiselect":false,"name":"wander_timer_min","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"2.5","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"wander_timer_max","filters":[],"listItems":[],"multiselect":false,"name":"wander_timer_max","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"4","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"idle_timer_min","filters":[],"listItems":[],"multiselect":false,"name":"idle_timer_min","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"4.5","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"idle_timer_max","filters":[],"listItems":[],"multiselect":false,"name":"idle_timer_max","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"7","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"attack_interval","filters":[],"listItems":[],"multiselect":false,"name":"attack_interval","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0.5","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"attack_distance","filters":[],"listItems":[],"multiselect":false,"name":"attack_distance","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"jumping","filters":[],"listItems":[],"multiselect":false,"name":"jumping","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"False","varType":3,},
    {"$GMObjectProperty":"v1","%Name":"disappear_timer","filters":[],"listItems":[],"multiselect":false,"name":"disappear_timer","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"-1","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"jump_height","filters":[],"listItems":[],"multiselect":false,"name":"jump_height","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"-5","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"collision_detection_range","filters":[],"listItems":[],"multiselect":false,"name":"collision_detection_range","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"8","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"held_gold_object","filters":[],"listItems":[],"multiselect":false,"name":"held_gold_object","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"","varType":5,},
    {"$GMObjectProperty":"v1","%Name":"run_away_and_chase_speed","filters":[],"listItems":[],"multiselect":false,"name":"run_away_and_chase_speed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"3.25","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"disappear_time_value","filters":[],"listItems":[],"multiselect":false,"name":"disappear_time_value","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"3.5","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"run_away_jump_height","filters":[],"listItems":[],"multiselect":false,"name":"run_away_jump_height","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"-6","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"held_gold_x_offset","filters":[],"listItems":[],"multiselect":false,"name":"held_gold_x_offset","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"6","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"held_gold_y_offset","filters":[],"listItems":[],"multiselect":false,"name":"held_gold_y_offset","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"-6","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"hit_run_away_timer","filters":[],"listItems":[],"multiselect":false,"name":"hit_run_away_timer","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"2","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"can_pick_up_gold","filters":[],"listItems":[],"multiselect":false,"name":"can_pick_up_gold","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"true","varType":3,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"sGoblin",
    "path":"sprites/sGoblin/sGoblin.yy",
  },
  "spriteMaskId":{
    "name":"sGoblin",
    "path":"sprites/sGoblin/sGoblin.yy",
  },
  "visible":true,
}