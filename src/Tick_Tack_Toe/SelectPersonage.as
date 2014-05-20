package Tick_Tack_Toe 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	public class SelectPersonage extends Sprite
	{
		
		private var _buttonStart:ButtonStart;
		private var _window:Window;
		
		public function SelectPersonage() 
		{
			_window = new Window(SelectPersXO, false, false);
			_window.addEventListener(Event.CLOSE, onCloseWindowSelectPers);
			addChild(_window);
			
			_buttonStart = new ButtonStart(360,400);
			_buttonStart.addEventListener(Event.CLOSE, onCloseWindowSelectPers);
			addChild(_buttonStart);
		}
		/*Событие кнопки "закрыть" окна меню.*/
		private function onCloseWindowSelectPers(e:Event):void 
		{
			this.removeChild(_window);
			this.removeChild(_buttonStart);
		}
	}

}