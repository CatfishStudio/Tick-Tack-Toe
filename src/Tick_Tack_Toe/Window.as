package Tick_Tack_Toe 
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	
	public class Window extends Sprite
	{
		/*Картинка окна*/
		[Embed(source = '../../images/window.png')]
		private var WImage:Class;
		private var _wImage:Bitmap = new WImage();
		/*Картинка кнопки закрыть*/
		[Embed(source = '../../images/bClose.png')]
		private var BCloseImage:Class;
		private var _bCloseImage:Bitmap = new BCloseImage();
		private var _buttonClose:Sprite = new Sprite();
		/*Маска*/
		private var _sprite_mask:Sprite = new Sprite();
		/*Содержание*/
		private var _content:Sprite;
		
		public function Window(Content:Class, bClose:Boolean, panelScroll:Boolean) 
		{
			//координаты окна по умолчанию
			this.x = 0; this.y = 0;
			//Перекрывающая область.
			this.graphics.beginFill(0x000000, 0.5);
			this.graphics.drawRect(0, 0, 800, 600);
			this.graphics.endFill();
			//картинка окнна
			_wImage.x = 150; _wImage.y = 50;
			this.addChild(_wImage);
			//кнопка закрыть
			_buttonClose.addChild(_bCloseImage);
			_buttonClose.x = 600;
			_buttonClose.y = 45;
			_buttonClose.addEventListener(MouseEvent.CLICK, onMouseClickButtonClose);
			_buttonClose.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutButtonClose);
			_buttonClose.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverButtonClose);
			if (bClose) this.addChild(_buttonClose);
						
			/*Содержимое (которое под маской)*/
			_content = new Content();
			_content.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheelContent);
			this.addChild(_content);
			
			/* спрайт-маска (области отображения) */ 
			_sprite_mask.graphics.beginFill(0x333333, 1); 
			_sprite_mask.graphics.drawRect(0, 0, 460, 400);
			_sprite_mask.x = 160; _sprite_mask.y = 90;
			_sprite_mask.graphics.endFill(); 
			addChild(_sprite_mask);
			
			/* применяем маску */ 
			_content.mask = _sprite_mask;
			
			/*Панель прокрутки списка*/
			if (panelScroll) {
				var _pScroll:PanelScroll = new PanelScroll(_content);
				_pScroll.x = 550; _pScroll.y = 80;
				this.addChild(_pScroll);
			}
		}
		
		/*События кнопки закрыть окно --------------------*/
		private function onMouseClickButtonClose(e:MouseEvent):void
		{
			dispatchEvent(new Event(Event.CLOSE));
		}
		private function onMouseOutButtonClose(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.AUTO;
		}
		private function onMouseOverButtonClose(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.BUTTON;
		}
		
		/*Событие скрола контента (колесом мыши) ---------*/
		private function onMouseWheelContent(e:MouseEvent):void
		{
			if(_content.height > 400){
				if (_content.y <= 0 && _content.y >= 400 - _content.height) {
					_content.y = _content.y + e.delta * 2;
					if (_content.y > 0) _content.y = 0;
					if (_content.y < 400 - _content.height) _content.y = 400 - _content.height;
				}
			}
		}
		
		
	}

}