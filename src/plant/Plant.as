package plant
{
	import other.Level;
	
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.filters.ColorMatrixFilter;

	public class Plant extends Sprite
	{
		public var mMovie:MovieClip;
		public var life:Number;
		public var hurtvalue:uint;
		public var number:uint;
		public var BeAttackRangex:Number;
		public var BeAttackRangey:Number;
		public var BeAttackRangewidth:Number;
		public var BeAttackRangeheight:Number;
		public var AttackRangex:Number;
		public var AttackRangey:Number;
		public var AttackRangewidth:Number;
		public var AttackRangeheight:Number;
		public var AttackChange:String;
		
		public var BrightFilter:ColorMatrixFilter = new ColorMatrixFilter();
		public var FlashCount:Number = 0;
		public var ifFleshing:Boolean = false;
		public var preFleshing:Boolean = false;
		public var Extrafps:Number = 1;
		public function Plant():void
		{
			BrightFilters[5] = new ColorMatrixFilter();
			BrightFilters[5].adjustBrightness(0.378);
			BrightFilters[6] = new ColorMatrixFilter();
			addEventListener(Event.ENTER_FRAME,ShovingFocus);
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
				GetFilter();
			}
			preFleshing = true;
			if(ifFleshing){return;}
			ifFleshing = true;
			FlashCount = 0;
			addEventListener(Event.ENTER_FRAME,Flashing);
		}
		public function GetFilter():void
		{
			for(var i:uint = 0; i<this.numChildren; i++)
			{
				if(this.getChildAt(i) is Image||this.getChildAt(i) is MovieClip)
				{
					FilterStoreArray[i] = this.getChildAt(i).filter;
				}
			}
		}
		//private var preBrightness:Number;
		public var bIfShoveled:uint = 2;
		public var prebIfShoveled:uint;
		public var FilterStoreArray:Array = new Array;
		//public var bpreIfShoveled:uint;
		private function ShovingFocus(e:Event):void
		{
			if(prebIfShoveled == 3)return;
			if(bIfShoveled == 1)
			{
				trace("focusing...");
				//for(var i:uint = 0; i<this.numChildren; i++)
				//{
					//if(this.getChildAt(i) is Image||this.getChildAt(i) is MovieClip)
					//{
						//this.getChildAt(i).filter = BrightFilters[5];
					//}
				//}
				alpha = 0;
			}
			prebIfShoveled = bIfShoveled;
			bIfShoveled = 2;
			if(prebIfShoveled == 2 && bIfShoveled == 2)
			{
				alpha = 1;
				trace("return...");
				prebIfShoveled = 3;
				for(var i:uint = 0; i<this.numChildren; i++)
				{
					if(this.getChildAt(i) is Image||this.getChildAt(i) is MovieClip)
					{
						this.getChildAt(i).filter = FilterStoreArray[i];
						//this.getChildAt(i).filter = BrightFilters[6];
					}
				}
			}
		}
		public function Flashing(e:Event):void
		{
			if(bIfShoveled == 1)
			{
				return;
			}
			FlashCount ++;
			if(FlashCount <= 6)
			{
				//BrightFilter = new ColorMatrixFilter();
				//BrightFilter.tint(0xFFFFFF, FlashCount*(0.133));
				//BrightFilter = SBrightFilter;
				//BrightFilter.adjustBrightness(-(preBrightness));
				//BrightFilter.adjustBrightness(FlashCount*(0.063));
				for(var i:uint = 0; i<this.numChildren; i++)
				{
					if(this.getChildAt(i) is Image||this.getChildAt(i) is MovieClip)
					{
						this.getChildAt(i).filter = BrightFilters[FlashCount - 1];
					}
				}
				//preBrightness = FlashCount*(0.063);
			}
			if(6 < FlashCount <= 12)
			{
				//BrightFilter = new ColorMatrixFilter();
				//BrightFilter.tint(0xFFFFFF, 0.8 - (FlashCount-6)*(0.133));
				//BrightFilter = SBrightFilter;
				//BrightFilter.adjustBrightness(-(preBrightness));
				//BrightFilter.adjustBrightness(0.36 - (FlashCount-6)*(0.063));
				for(var i:uint = 0; i<this.numChildren; i++)
				{
					if(this.getChildAt(i) is Image||this.getChildAt(i) is MovieClip)
					{
						this.getChildAt(i).filter = BrightFilters[12 - FlashCount];
					}
				}
				//preBrightness = 0.36 - (FlashCount-6)*(0.063);
			}
			if(FlashCount >= 13||!preFleshing)
			{
				//BrightFilter.adjustBrightness(-(preBrightness));
				//BrightFilter.adjustBrightness(0.8 - (FlashCount-6)*(0.133));
				//BrightFilter.tint(0xFFFFFF, 0);
				for(var i:uint = 0; i<this.numChildren; i++)
				{
					if(this.getChildAt(i) is Image||this.getChildAt(i) is MovieClip)
					{
						this.getChildAt(i).filter = FilterStoreArray[i];
					}
				}
				ifFleshing = false;
				removeEventListener(Event.ENTER_FRAME,Flashing);
			}
			preFleshing = false;
		}
	}
}