class CarController {
  //Forbinder - Sensorer & Hjerne & Bil
  float varians             = 2; //hvor stor er variansen på de tilfældige vægte og bias
  Car bil                    = new Car();
  NeuralNetwork hjerne       = new NeuralNetwork(varians); 
  SensorSystem  sensorSystem = new SensorSystem();
      
   public float fitness;
   float[] genes;
   
  void update() {
    //1.)opdtarer bil 
    bil.update();
    //2.)opdaterer sensorer    
    sensorSystem.updateSensorsignals(bil.pos, bil.vel);
    //3.)hjernen beregner hvor meget der skal drejes
    float turnAngle = 0;
    float x1 = int(sensorSystem.leftSensorSignal);
    float x2 = int(sensorSystem.frontSensorSignal);
    float x3 = int(sensorSystem.rightSensorSignal);    
    turnAngle = hjerne.getOutput(x1, x2, x3);    
    //4.)bilen drejes
    bil.turnCar(turnAngle);
  }
   void fitness () { 
    fitness = sensorSystem.clockWiseRotationFrameCounter;
    }
    
    void cloneGenes () {
     
    //arrayCopy(
   // hjerne.biases[i-8]
    }
    
        /*
    void mutate(float mutationRate) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
        randomNUM = (int)random(0, 1);
        if (randomNUM ==1) {
          genes[i]=false;
        } else {
        }
        genes[i] = true;  // Pick from range of chars
      }
    }
  }*/
  
  void display(){
    bil.displayCar();
    sensorSystem.displaySensors();
  }
}
