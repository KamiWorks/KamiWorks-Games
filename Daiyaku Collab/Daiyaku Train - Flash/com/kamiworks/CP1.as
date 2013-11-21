package com.kamiworks 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.system.System;
	import flash.utils.Timer;
	
	public class CP1 extends MovieClip
	{
		private var start_screen:StartScreen;
		private var game:Game;
		private var t:Timer;
		private var n:int, lastN:int;
		
		public function CP1():void
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			SpitMem();
		}
		
		private function init(e:Event=null):void{
			start_screen = new StartScreen;
			addChild(start_screen);
			start_screen.addEventListener("Start Game", game_event_handler);
		}
		
		private function game_event_handler(e:Event):void{
			switch(e.type){
				case "Start Game":
					remove_start_menu();
					start_game();
					break;
			}
		}
		
		private function start_game():void{
			game = new Game;
			addChild(game);
			game.addEventListener("Game Over", game_over_handler);
		}
		
		private function remove_start_menu():void{
			removeChild(start_screen);
		}
		
		private function game_over_handler(e:Event):void{
			game.removeEventListener("Game Over", game_over_handler);
			removeChild(game);
			init();
		}
		
		public function SpitMem():void {
			t = new Timer(0);
			t.addEventListener("timer", spit2, false, 0, true);
			t.start();
		}
		
		private function spit1():void {
			trace(System.totalMemory);
		}
		
		private function spit2(e:TimerEvent=null):void {
			n = System.totalMemory;
			if (n != lastN)
				trace(n);
			lastN = n;
		}
	}
}