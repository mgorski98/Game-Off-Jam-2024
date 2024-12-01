{
  "$GMObject":"",
  "%Name":"obj_start_elevator",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":10,"eventType":7,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":2,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_start_elevator",
  "overriddenProperties":[],
  "parent":{
    "name":"Objects",
    "path":"folders/Objects.yy",
  },
  "parentObjectId":{
    "name":"interactable",
    "path":"objects/interactable/interactable.yy",
  },
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
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"current_gold_pieces","filters":[],"listItems":[],"multiselect":false,"name":"current_gold_pieces","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"min_gold_pieces","filters":[],"listItems":[],"multiselect":false,"name":"min_gold_pieces","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"4","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"max_gold_pieces","filters":[],"listItems":[],"multiselect":false,"name":"max_gold_pieces","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"4","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"target_gold_pieces","filters":[],"listItems":[],"multiselect":false,"name":"target_gold_pieces","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"can_go_back","filters":[],"listItems":[],"multiselect":false,"name":"can_go_back","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"False","varType":3,},
    {"$GMObjectProperty":"v1","%Name":"status_text_y_offset","filters":[],"listItems":[],"multiselect":false,"name":"status_text_y_offset","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"gold_quota_met_color","filters":[],"listItems":[],"multiselect":false,"name":"gold_quota_met_color","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"$FF15FF00","varType":7,},
    {"$GMObjectProperty":"v1","%Name":"gold_quota_missing_color","filters":[],"listItems":[],"multiselect":false,"name":"gold_quota_missing_color","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"$FF0000FF","varType":7,},
    {"$GMObjectProperty":"v1","%Name":"current_status_text","filters":[],"listItems":[],"multiselect":false,"name":"current_status_text","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0/0","varType":2,},
    {"$GMObjectProperty":"v1","%Name":"elevator_speed","filters":[],"listItems":[],"multiselect":false,"name":"elevator_speed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"1.5","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"elevator_disappear_time","filters":[],"listItems":[],"multiselect":false,"name":"elevator_disappear_time","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"15","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"elevator_move_time","filters":[],"listItems":[],"multiselect":false,"name":"elevator_move_time","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"2.5","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"elevator_direction","filters":[],"listItems":[],"multiselect":false,"name":"elevator_direction","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"1","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"elevator_going","filters":[],"listItems":[],"multiselect":false,"name":"elevator_going","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"True","varType":3,},
    {"$GMObjectProperty":"v1","%Name":"elevator_going_timer","filters":[],"listItems":[],"multiselect":false,"name":"elevator_going_timer","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"-1","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"elevator_disappeared","filters":[],"listItems":[],"multiselect":false,"name":"elevator_disappeared","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"False","varType":3,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"elevator",
    "path":"sprites/elevator/elevator.yy",
  },
  "spriteMaskId":null,
  "visible":true,
}