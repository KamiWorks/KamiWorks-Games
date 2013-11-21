package com.kamiworks
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class Game extends MovieClip
	{
		private var direction:String = "Left";
		private var background:Background = new Background;
		private var meter:Meter = new Meter(155,380);
		private var daiyachan:DaiyaChan = new DaiyaChan(450, 110);
		private var newspaperman:NewspaperMan = new NewspaperMan(205, 85);		
		private var protagkun:ProtagonistKun = new ProtagonistKun(290, 150);
		private var random_number:int;
		private var count:int = 0;
		
		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE, start);
		}
		
		private function start(e:Event):void{
			addEventListener(Event.ENTER_FRAME, mainLoop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
			random_number = generateRandomNumber();
			addObjects();
			meter.start();
		}
		
		private function mainLoop(e:Event):void{
			randomiser();
		}
		
		private function addObjects():void{
			addBackground();
			addDaiyaChan();
			addNewspaperMan();
			addProtagKun();
			addMeter();
		}
		
		private function addMeter():void{
			addChild(meter);
			meter.addEventListener("HIT_RIGHT", hitDaiya);
			meter.addEventListener("HIT_LEFT", hitNewspaperMan);
		}
		
		private function keyHandler(e:KeyboardEvent):void{
			switch(e.keyCode){
				case 37:
				case 65:
					// Left					
					meter.movePointer("Left", 5);
					protagkun.moveHead("Left", 5);
				break;
				case 39:
				case 68:
					//Right
					meter.movePointer("Right", 5);
					protagkun.moveHead("Right", 5);
				break;
			}
		}
		
		private function randomiser(){		
			if(count == random_number){
				count = 0;
				random_number = generateRandomNumber();
				meter.direction == "Left" ? meter.changeDirection("Right") : meter.changeDirection("Left");
				protagkun.changeDirection(meter.direction);
			}
			count++;
		}
		
		private function generateRandomNumber():int{
			return Math.round(Math.random()*30+1);
		}
		
		private function addBackground():void{
			addChild(background);
		}
		
		private function addDaiyaChan():void{
			addChild(daiyachan);
			daiyachan.addEventListener("Max Rage", gameOver);
		}
		
		private function addNewspaperMan():void{
			addChild(newspaperman);
			newspaperman.addEventListener("Max Rage", gameOver);
		}
		
		private function addProtagKun():void{
			addChild(protagkun);
		}
		
		private function hitDaiya(e:Event):void{
			daiyachan.increaseRage();
		}
		
		private function hitNewspaperMan(e:Event):void{
			newspaperman.increaseRage();
		}
		
		private function gameOver(e:Event=null):void{
			removeEventListener(Event.ENTER_FRAME, mainLoop);
			meter.kill();
			protagkun.kill();
			dispatchEvent(new Event("Game Over"));
		}
	}
}