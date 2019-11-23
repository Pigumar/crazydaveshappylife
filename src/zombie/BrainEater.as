package zombie
{
	import other.Frames;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.textures.Texture;

	public class BrainEater extends Zombie
	{
		public var DisplayShapes:Array = new Array;
		public function BrainEater(images:Array, imagesx:Array, imagesy:Array)
		{
			super( -1 );
			for(var i:uint = 0; i < images.length; i++)
			{
				if(images[i] is Frames)
				{
					DisplayShapes[i] = new MovieClip(images[i].frames, 24);
					DisplayShapes[i].x = imagesx[i];
					DisplayShapes[i].y = imagesy[i];
					addChild(DisplayShapes[i]);
					Starling.juggler.add(DisplayShapes[i]);
				}
				if(images[i] is Texture)
				{
					DisplayShapes[i] = new Image(images[i]);
					DisplayShapes[i].x = imagesx[i];
					DisplayShapes[i].y = imagesy[i];
					addChild(DisplayShapes[i]);
				}
			}
		}
	}
}