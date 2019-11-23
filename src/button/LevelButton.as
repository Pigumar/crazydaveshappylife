package button
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class LevelButton extends Button
	{
		public var LevelNumber:uint=12;
		private var ObjectVector:Vector.<Image> = new Vector.<Image>(2, true);
		private static const NumberSheet:Class=Assets.LevelNumber;
		public static const NumberSheetXML:Class=Assets.LevelNumberXML;
		
		private static const LevelButtonBody:Class=Assets.Dream_BackGround_LevelButton;
		
		public function LevelButton(LevelNum:uint)
		{
			var LevelButtonBitmap:Bitmap = new LevelButtonBody();
			var LevelButtontexture:Texture = Texture.fromBitmap(LevelButtonBitmap);
			super(LevelButtontexture,"", null);
			LevelNumber=LevelNum;
			AddNumbers();
		}
		
		private function AddNumbers():void
		{
			var bitmap:Bitmap = new NumberSheet();
			var texture:Texture = Texture.fromBitmap(bitmap);
			var xml:XML = XML(new NumberSheetXML());
			var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
			var frames:Vector.<Texture> = sTextureAtlas.getTextures("LevelNumber");
			
			if((LevelNumber-LevelNumber%10)/10>0)
			{
				var Twicetexture:Texture = frames[(LevelNumber-LevelNumber%10)/10];
				var image:Image = new Image(Twicetexture);
				image.x = 17.95;
				image.y = 17.5;
				addChild(image);
				ObjectVector[0] = image;
				
				var Twicetexture2:Texture = frames[LevelNumber%10];
				var image2:Image = new Image(Twicetexture2);
				image2.x = 25;
				image2.y = 17.5;
				addChild(image2);
				ObjectVector[1] = image2;
			}
			else
			{
				var Oncetexture:Texture = frames[LevelNumber];
				var image3:Image = new Image(Oncetexture);
				image3.x = 33.45;
				image3.y = 17.5;
				addChild(image3);
				ObjectVector[2] = image3;
			}
		}
		
		public override function hitTest(localPoint:Point, forTouch:Boolean=false):DisplayObject
		{
			if (forTouch && (!visible || !touchable)) 
				return null; 
			
			var bounds:Rectangle = this.bounds;
			var centerX:Number = bounds.width / 2;
			var centerY:Number = bounds.height / 2;
			
			var sqDist:Number = Math.pow(localPoint.x - centerX, 2) + 
				Math.pow(localPoint.y - centerY, 2);
			
			var radius:Number = bounds.width / 2;
			if (sqDist < Math.pow(radius, 2)) return this;
			else return null;
		}
	}
}