//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int       populationSize  = 100;     
int timer = 0;
float simulationTimer = 10;
int bestFitness;
int generations = 1;

boolean showSensors = false;

CarSystem carSystem       = new CarSystem(populationSize);

//trackImage: RacerBanen , Vejen=sort, Udenfor=hvid, Målstreg= 100%grøn 
PImage    trackImage;

void setup() {
  size(500, 600);
  trackImage = loadImage("track.png");
}

void draw() {
  
  clear();
  background(255);
  fill(0);
  rect(0, 0, 1000, 80);
  image(trackImage, 0, 80);  
   
  textSize(24);
  fill(255);
  text("Time Left: " + (10*generations-int(millis()/1000)), 10, 25);
  text("Best score Gen "+generations+": "+int(carSystem.topFitness) ,210, 75); 
  text("Best score: " + bestFitness, 210, 25);
   text("Population size: " +populationSize ,210, 50); 
  text("Generation: " + generations, 10, 50);
  fill(255,0,0);
  text("Press 'enter' to show sensors", 80, 560);
  carSystem.calcFitness();
  simulate();
  carSystem.run();
  carSystem.naturalSelection();
}


void simulate() {
  if (millis() > timer+simulationTimer*1000) {
    timer = millis();

    if (bestFitness < carSystem.topFitness) {
    bestFitness = int(carSystem.topFitness);
    }
    carSystem.generate();
    for (int i = 0; i < populationSize; i++) {
      carSystem.population[i].reset();            
    }
    generations++;
  }
}

void keyPressed(){
  if (keyCode == (int)ENTER){
    showSensors = !showSensors;
  }
}
