package zombie
{
	import other.Level;
	
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.filters.ColorMatrixFilter;

	public class Zombie extends Sprite
	{
		public var mMovie:MovieClip;
		public var life:Number;
		public var Armorlife:Number;
		public var hurtvalue:uint;
		public var number:uint;
		public var Judge:String="Usual";
		public var AttackRangex:Number;
		public var AttackRangey:Number;
		public var AttackRangewidth:Number;
		public var AttackRangeheight:Number;
		public var BeAttackRangex:Number;
		public var BeAttackRangey:Number;
		public var BeAttackRangewidth:Number;
		public var BeAttackRangeheight:Number;
		public var DetectRangex:Number;
		public var DetectRangey:Number;
		public var DetectRangewidth:Number;
		public var DetectRangeheight:Number;
		public var ArmorJudge:String="None";
		
		public var BrightFilter:ColorMatrixFilter = new ColorMatrixFilter();
		public var FlashCount:Number = 0;
		public var ifFleshing:Boolean = false;
		public var filterArray:Array = new Array();
		private var IfWriteArray:Boolean = false;
		public var Extrafps:Number = 1;
		public function Zombie(num:Number = -1):void
		{
			number = num;
		}	
		public var bFirstFlash:Boolean = false;
		public var BrightFilters:Array = new Array;
		public function Flash():void
		{
			if(!bFirstFlash)
			{
				bFirstFlash = true;
				BrightFilters[0] = new ColorMatrixFilter();
				BrightFilters[0].adjustBrightness(0.063);
				BrightFilters[1] = new ColorMatrixFilter();
				BrightFilters[1].adjustBrightness(0.126);
				BrightFilters[2] = new ColorMatrixFilter();
				BrightFilters[2].adjustBrightness(0.189);
				BrightFilters[3] = new ColorMatrixFilter();
				BrightFilters[3].adjustBrightness(0.252);
				BrightFilters[4] = new ColorMatrixFilter();
				BrightFilters[4].adjustBrightness(0.315);
				BrightFilters[5] = new ColorMatrixFilter();
				BrightFilters[5].adjustBrightness(0.378);
			}
			if(!IfWriteArray)
			{
				for(var i:uint = 0; i<this.numChildren; i++)
				{
					if(this.getChildAt(i) is Image||this.getChildAt(i) is MovieClip)
					{
						filterArray[i] = this.getChildAt(i).filter;
					}
				}
				IfWriteArray = true;
			}
			if(ifFleshing || life<0 || Judge=="Dead"){return;}
			ifFleshing = true;
			FlashCount = 0;
			addEventListener(Event.ENTER_FRAME,Flashing);
		}
		public function Flashing():void
		{
			FlashCount ++;
			if(FlashCount <= 6)
			{
				for(var i:uint = 0; i<this.numChildren; i++)
				{
					if(this.getChildAt(i) is Image||this.getChildAt(i) is MovieClip)
					{
						this.getChildAt(i).filter = BrightFilters[FlashCount - 1];
					}
				}
			}
			if(6 < FlashCount <= 12)
			{
				for(var i:uint = 0; i<this.numChildren; i++)
				{
					if(this.getChildAt(i) is Image||this.getChildAt(i) is MovieClip)
					{
						this.getChildAt(i).filter = BrightFilters[12 - FlashCount];
					}
				}
			}
			if(FlashCount >= 13|| life<0 || Judge=="Dead")
			{
				BrightFilter.dispose();
				for(var i:uint = 0; i<this.numChildren; i++)
				{
					if(this.getChildAt(i) is Image||this.getChildAt(i) is MovieClip)
					{
						this.getChildAt(i).filter = filterArray[i];
					}
				}
				ifFleshing = false;
				removeEventListener(Event.ENTER_FRAME,Flashing);
			}
		}
	}
}