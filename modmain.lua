function crsCustomPerishable(inst)
 if GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) then
  inst.CustomUpdate = function (this, dt)
   if this.components.perishable then
    local modifier = 1
    local owner = this.components.inventoryitem and this.components.inventoryitem.owner or nil
    if owner then
     if owner:HasTag("fridge") then
      if this:HasTag("frozen") and not owner:HasTag("nocool") and not owner:HasTag("lowcool") then
       modifier = TUNING.PERISH_COLD_FROZEN_MULT
      else
       modifier = TUNING.PERISH_FRIDGE_MULT
      end
     elseif owner:HasTag("spoiler") then
      modifier = TUNING.PERISH_GROUND_MULT
     elseif owner:HasTag("crsCustomPerishMult") then -- added
      if this:HasTag("frozen") and not owner:HasTag("nocool") and not owner:HasTag("lowcool") then
       modifier = TUNING.PERISH_COLD_FROZEN_MULT
      else
       modifier = owner.crsCustomPerishMult
      end
     end
    else
     modifier = TUNING.PERISH_GROUND_MULT
    end

    if this.components.edible and this.components.edible.temperaturedelta and this.components.edible.temperaturedelta > 0 then
     if owner and owner:HasTag("fridge") then
      if not owner:HasTag("nocool") then
       this.components.edible.temperatureduration = this.components.edible.temperatureduration - 1
      end
     elseif owner and owner:HasTag("crsCustomTempDuration") then
      if not owner:HasTag("nocool") then
       this.components.edible.temperatureduration = this.components.edible.temperatureduration + owner.crsCustomTempDuration
      end
     elseif GLOBAL.GetSeasonManager() and GLOBAL.GetSeasonManager():GetCurrentTemperature() < TUNING.OVERHEAT_TEMP - 5 then
      this.components.edible.temperatureduration = this.components.edible.temperatureduration - .25
     end
     if this.components.edible.temperatureduration < 0 then
      this.components.edible.temperatureduration = 0
     end
    end

    local mm = GLOBAL.GetWorld().components.moisturemanager
    if mm:IsEntityWet(this) then
     modifier = modifier * TUNING.PERISH_WET_MULT
    end

    if GLOBAL.GetSeasonManager() and GLOBAL.GetSeasonManager():GetCurrentTemperature() < 0 then
     if this:HasTag("frozen") and not this.components.perishable.frozenfiremult then
      modifier = TUNING.PERISH_COLD_FROZEN_MULT
     else
      modifier = modifier * TUNING.PERISH_WINTER_MULT
     end
    end

    if this.components.perishable.frozenfiremult then
     modifier = modifier * TUNING.PERISH_FROZEN_FIRE_MULT
    end

    if GLOBAL.GetSeasonManager() and GLOBAL.GetSeasonManager():GetCurrentTemperature() > TUNING.OVERHEAT_TEMP then
     modifier = modifier * TUNING.PERISH_SUMMER_MULT
    end

    modifier = modifier * TUNING.PERISH_GLOBAL_MULT

    local old_val = this.components.perishable.perishremainingtime
    local delta = dt or (10 + math.random()*FRAMES*8)
    this.components.perishable.perishremainingtime = this.components.perishable.perishremainingtime - delta*modifier
    if math.floor(old_val*100) ~= math.floor(this.components.perishable.perishremainingtime*100) then
     this:PushEvent("perishchange", {percent = this.components.perishable:GetPercent()})
    end

    if this.components.perishable.perishremainingtime <= 0 then
     this.components.perishable:Perish()
    end
   end
  end
 elseif GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC) then
  inst.CustomUpdate = function (this, dt)
   if this.components.perishable then
    local modifier = 1
    local owner = this.components.inventoryitem and this.components.inventoryitem.owner or nil
    if owner then
     if owner:HasTag("fridge") then
      if this:HasTag("frozen") and not owner:HasTag("nocool") and not owner:HasTag("lowcool") then
      modifier = TUNING.PERISH_COLD_FROZEN_MULT
      else
      modifier = TUNING.PERISH_FRIDGE_MULT 
      end
     elseif owner:HasTag("spoiler") then
      modifier = TUNING.PERISH_GROUND_MULT
     elseif owner:HasTag("crsCustomPerishMult") then -- added
      if this:HasTag("frozen") and not owner:HasTag("nocool") and not owner:HasTag("lowcool") then
       modifier = TUNING.PERISH_COLD_FROZEN_MULT
      else
       modifier = owner.crsCustomPerishMult
      end
     end
    else
     modifier = TUNING.PERISH_GROUND_MULT
    end

    if this.components.edible and this.components.edible.temperaturedelta and this.components.edible.temperaturedelta > 0 then
     if owner and owner:HasTag("fridge") then
      if not owner:HasTag("nocool") then
       this.components.edible.temperatureduration = this.components.edible.temperatureduration - 1
      end
     elseif owner and owner:HasTag("crsCustomTempDuration") then
      if not owner:HasTag("nocool") then
       this.components.edible.temperatureduration = this.components.edible.temperatureduration + owner.crsCustomTempDuration
      end
     elseif GLOBAL.GetSeasonManager() and GLOBAL.GetSeasonManager():GetCurrentTemperature() < TUNING.OVERHEAT_TEMP - 5 then
      this.components.edible.temperatureduration = this.components.edible.temperatureduration - .25
     end
     if this.components.edible.temperatureduration < 0 then
      this.components.edible.temperatureduration = 0 
     end
    end

    local mm = GLOBAL.GetWorld().components.moisturemanager
    if mm:IsEntityWet(this) then
     modifier = modifier * TUNING.PERISH_WET_MULT
    end

    if GLOBAL.GetSeasonManager() and GLOBAL.GetSeasonManager():GetCurrentTemperature() < 0 then
     if this:HasTag("frozen") and not this.components.perishable.frozenfiremult then
      modifier = TUNING.PERISH_COLD_FROZEN_MULT
     else
      modifier = modifier * TUNING.PERISH_WINTER_MULT
     end
    end

    if this.components.perishable.frozenfiremult then
     modifier = modifier * TUNING.PERISH_FROZEN_FIRE_MULT
    end

    if GLOBAL.GetSeasonManager() and GLOBAL.GetSeasonManager():GetCurrentTemperature() > TUNING.OVERHEAT_TEMP then
     modifier = modifier * TUNING.PERISH_SUMMER_MULT
    end

    modifier = modifier * TUNING.PERISH_GLOBAL_MULT

    local old_val = this.components.perishable.perishremainingtime
    local delta = dt or (10 + math.random()*FRAMES*8)
    this.components.perishable.perishremainingtime = this.components.perishable.perishremainingtime - delta*modifier
    if math.floor(old_val*100) ~= math.floor(this.components.perishable.perishremainingtime*100) then
     this:PushEvent("perishchange", {percent = this.components.perishable:GetPercent()})
    end

    if this.components.perishable.perishremainingtime <= 0 then
     this.components.perishable:Perish()
    end
   end
  end
 else
  inst.CustomUpdate = function (this, dt)
   if this.components.perishable then
    local modifier = 1
    local owner = this.components.inventoryitem and this.components.inventoryitem.owner or nil
    if owner then
     if owner:HasTag("fridge") then
      modifier = TUNING.PERISH_FRIDGE_MULT
     elseif owner:HasTag("spoiler") then
      modifier = TUNING.PERISH_GROUND_MULT
     elseif owner:HasTag("crsCustomPerishMult") then -- added
      modifier = owner.crsCustomPerishMult
     end
    else
     modifier = TUNING.PERISH_GROUND_MULT 
    end

    if GLOBAL.GetSeasonManager() and GLOBAL.GetSeasonManager():GetCurrentTemperature() < 0 then
     modifier = modifier * TUNING.PERISH_WINTER_MULT
    end

    modifier = modifier * TUNING.PERISH_GLOBAL_MULT

    local old_val = this.components.perishable.perishremainingtime
    this.components.perishable.perishremainingtime = this.components.perishable.perishremainingtime - dt*modifier
    if math.floor(old_val*100) ~= math.floor(this.components.perishable.perishremainingtime*100) then
     this:PushEvent("perishchange", {percent = this.components.perishable:GetPercent()})
    end

    if this.components.perishable.perishremainingtime <= 0 then
     this.components.perishable:Perish()
    end
   end
  end
 end

 if GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) then
  inst.LongUpdate = function(self, dt)
   if self.updatetask then
    inst.CustomUpdate(self.inst, dt or 0)
   end
  end
 elseif GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC) then
  inst.LongUpdate = function(self, dt)
   if self.updatetask then
    inst.CustomUpdate(self.inst, dt or 0)
   end
  end
 else
  inst.LongUpdate = function(self, dt)
   print("test ok")
   inst.CustomUpdate(self.inst, dt)
  end
 end

 inst.StartPerishing = function (self)
  if self.updatetask then
   self.updatetask:Cancel()
   self.updatetask = nil
  end

   local dt = 10 + math.random()*GLOBAL.FRAMES*8 -- math.max( 4, math.min( self.perishtime / 100, 10)) + ( math.random()* FRAMES * 8)

   if dt > 0 then
    self.updatetask = self.inst:DoPeriodicTask(dt, inst.CustomUpdate, math.random()*2, dt)
   else
    inst:CustomUpdate(self.inst, 0)
   end
  end
end
AddComponentPostInit("perishable", crsCustomPerishable)
