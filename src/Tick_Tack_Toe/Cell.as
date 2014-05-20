package Tick_Tack_Toe 
{
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	
	public class Cell extends Sprite
	{
		public var Index:int;
		private var _cellImageX1:Bitmap;
		private var _cellImageX2:Bitmap;
		private var _cellImageO1:Bitmap;
		private var _cellImageO2:Bitmap;
		
		public function Cell(x:int, y:int) 
		{
			_cellImageX1 = new Level.XImage1();
			_cellImageX1.alpha = 0;
			this.addChild(_cellImageX1);
			_cellImageX2 = new Level.XImage2();
			_cellImageX2.alpha = 0;
			this.addChild(_cellImageX2);
			_cellImageO1 = new Level.OImage1();
			_cellImageO1.alpha = 0;
			this.addChild(_cellImageO1);
			_cellImageO2 = new Level.OImage2();
			_cellImageO2.alpha = 0;
			this.addChild(_cellImageO2);
			this.x = x;
			this.y = y;
			this.addEventListener(MouseEvent.CLICK, onMouseClick);
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
		}
		
		/*Событие выбор Искуственного Интелекта*/
		public function ChangePC():void
		{
			if(Level.indexState[Index] == 0 && Level.endGame == false){
				if (!Level.turn) {
					_cellImageX1.alpha = 1;
					_cellImageX2.alpha = 0;
					Level.indexState[Index] = 1; //установлен крестик
					Level.turn = true;
				}else{
					_cellImageO1.alpha = 1;
					_cellImageO2.alpha = 0;
					Level.indexState[Index] = 2; //установлен нолик
					Level.turn = false;
				}
				Level.indexState[0] = 10; //флаг передачи управления Пользователю
			}			
			
		}
		
		//Событие при нажатии кнопки мыши. (выбор Пользователя)
		private function onMouseClick(e:MouseEvent):void
		{
			if(Options.soundOffOn) Level.snd1.play(); //воспроизведение звука
			if(Level.indexState[Index] == 0 && Level.endGame == false){
				if (!Level.turn) {
					_cellImageX1.alpha = 1;
					_cellImageX2.alpha = 0;
					Level.indexState[Index] = 1; //установлен крестик
					Level.turn = true;
				}else{
					_cellImageO1.alpha = 1;
					_cellImageO2.alpha = 0;
					Level.indexState[Index] = 2; //установлен нолик
					Level.turn = false;
				}
				if(Options.enableAI) Level.indexState[0] = 11; //флаг передачи управления ИИ
			}			
			dispatchEvent(new Event(Event.CHANGE)); //возвращает событие.
		}
		
		//События при движении курсора над ячейкой.
		private function onMouseOut(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.AUTO;
			if (!Level.turn && Level.indexState[Index] == 0)_cellImageX2.alpha = 0;
			if (Level.turn && Level.indexState[Index]==0)_cellImageO2.alpha = 0;
		}
		private function onMouseOver(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.BUTTON;
			if (!Level.turn && Level.indexState[Index] == 0)_cellImageX2.alpha = 1;
			if (Level.turn && Level.indexState[Index]==0)_cellImageO2.alpha = 1;
		}
	}

}