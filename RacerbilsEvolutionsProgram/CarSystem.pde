class CarSystem {

  DNA[] population;
  ArrayList<DNA> matingPool;
  float mutationRate = 0.01; //Procent rate for hver enkel
  float topFitness;

  CarSystem(int populationSize) {
    population = new DNA[populationSize];

    for (int i=0; i<populationSize; i++) { 
      population[i] = new DNA(2);
    }
  }

  void calcFitness() {
    for (int i=0; i<populationSize; i++) {
      population[i].fitness();
    }
  }

  void naturalSelection() {

    matingPool = new ArrayList<DNA>();
    float maxFitness = 0;
    for (int i = 0; i < populationSize; i++) {
      if (population[i].fitness > maxFitness) {
        maxFitness = population[i].fitness;
        topFitness = maxFitness;
      }
    }

    for (int i = 0; i < populationSize; i++) {
      int n = int(population[i].fitness/maxFitness*100);
      for (int j = 0; j < n; j++) {   
        matingPool.add(population[i]);
      }
    }
  }  

  void generate() {
 if (matingPool.size() == 0){
    for (int i=0; i<populationSize; i++) {
        DNA child = new DNA(2);
        child.mutate(mutationRate*50);
         population[i] = child;
    }
  }
      else{
         for (int i=0; i<populationSize; i++) {
      DNA child = matingPool.get(int(random(matingPool.size()))).newDNA();
      child.mutate(mutationRate);
      population[i] = child;
    }
 }
}


  void run() {
    for (DNA dna : population) {
      if (dna.sensorSystem.whiteSensorFrameCount<=0) dna.update();
    }
    for (DNA dna : population) {
      if (dna.sensorSystem.whiteSensorFrameCount<=0) dna.display();
    }
  }
}
