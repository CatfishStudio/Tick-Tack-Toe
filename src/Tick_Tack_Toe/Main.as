package Tick_Tack_Toe
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import flash.net.URLRequest;
	import Tick_Tack_Toe.Level;
	import Tick_Tack_Toe.ButtonInfo;
	import Tick_Tack_Toe.SelectPersonage;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	
	public class Main extends Sprite 
	{
		/*Загрузка картинок -------------------------------*/
		[Embed(source = '../../images/bgimage.png')]
		private var BGImage:Class;
		private var _bgBmpImage:Bitmap;
		
		[Embed(source = '../../images/logo.png')]
		private var Logo:Class;
		private var _imageLogo:Bitmap;
		private var sLogo:Sprite = new Sprite();
				
		/*Окно*/
		private var _window:Window;
		private var _windowShow:Boolean = false;
		
		/* Главная Функция */
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/* Инициализация */
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			/* фоновое изображение (ФОН)*/
			_bgBmpImage = new BGImage ();
			this.addChild(_bgBmpImage);
			
			/*лого + текст*/
			_imageLogo = new Logo();
			_imageLogo.x = 5; _imageLogo.y = 545;
			sLogo.addChild(_imageLogo);
			sLogo.addEventListener(MouseEvent.CLICK, onMouseClickLogo);
			sLogo.addEventListener(MouseEvent.MOUSE_OUT, onMouseLogoOut);
			sLogo.addEventListener(MouseEvent.MOUSE_OVER, onMouseLogoOver);
			this.addChild(sLogo);
			var _textLabel:Label = new Label(60, 560, 700, 50, "System", 16, 0xFFFFFF, "<b>2013 © Catfish Studio.                   developer: Евгений Сомов           sound: Дмитрий Калинченко<b>")
			this.addChild(_textLabel);
			
			/*Текст под игровым полем*/
			var _textLabel:Label = new Label(60, 430, 500, 50, "Aria", 16, 0xFFFFFF, "При окончании ходов, чтобы начать игру заново")
			this.addChild(_textLabel);
			var _textLabel:Label = new Label(60, 460, 500, 50, "Aria", 16, 0xFFFFFF, "нажмите на любую ячейку поля.")
			this.addChild(_textLabel);
			
			/* Кнопка "Информации" (КНОПКА)*/
			var bInfo:ButtonInfo = new ButtonInfo();
			bInfo.addEventListener(MouseEvent.CLICK, onMouseClickButtonInfo);
			this.addChild(bInfo);
			
			/* Кнопка "Настройки" (КНОПКА)*/
			var bSettings:ButtonOptions = new ButtonOptions();
			bSettings.addEventListener(MouseEvent.CLICK, onMouseClickButtonSettings);
			this.addChild(bSettings);
			
			/* Запуск игры (УРОВЕНЬ)*/
			Options.enableAI = true; //включить искуственный интелект
			var StartGame:Level = new Level();
			this.addChild(StartGame);
			
			/* Выбор персонажа (ОКНО)*/
			var WinSelectPers:SelectPersonage = new SelectPersonage();
			this.addChild(WinSelectPers);
		}
		
				
		/*Событие кнопки ИНФОРМАЦИЯ -------------------------------------*/
		private function onMouseClickButtonInfo(e:MouseEvent):void
		{
			
			if(Options.soundOffOn) Level.snd5.play(); //воспроизведение звука
			if(_windowShow == false){
				_window = new Window(Statistics, true, true);
				_window.addEventListener(Event.CLOSE, onCloseWindow);
				addChild(_window);
				_windowShow = true;
			}
		}
		/*Событие кнопки НАСТНОЙКИ */
		private function onMouseClickButtonSettings(e:MouseEvent):void
		{
			if(Options.soundOffOn) Level.snd5.play(); //воспроизведение звука
			if (_windowShow == false) {
				_window = new Window(Options, true, false);
				_window.addEventListener(Event.CLOSE, onCloseWindow);
				addChild(_window);
				_windowShow = true;
			}
		}
		/*Событие кнопки "закрыть" окна.*/
		private function onCloseWindow(e:Event):void 
		{
			if(Options.soundOffOn) Level.snd2.play(); //воспроизведение звука
			this.removeChild(_window);
			_windowShow = false;
		}
		/*Собятие логотипа*/
		private function onMouseClickLogo(e:MouseEvent):void
		{
			var request:URLRequest = new URLRequest('https://vk.com/club62618339');
			navigateToURL(request);
		}
		private function onMouseLogoOut(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.AUTO;
		}
		private function onMouseLogoOver(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.BUTTON;
		}
		/*-----------------------------------------------------------------*/
	}
	
}