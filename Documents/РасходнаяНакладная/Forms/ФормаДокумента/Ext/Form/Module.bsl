﻿
&НаКлиенте
Процедура СписокНоменклатурыКоличествоПриИзменении(Элемент)
	ЦенаКоличествоПриИзменении();
КонецПроцедуры

&НаКлиенте
Процедура СписокНоменклатурыЦенаПриИзменении(Элемент)
	ЦенаКоличествоПриИзменении();
КонецПроцедуры 

&НаКлиенте
Процедура ЦенаКоличествоПриИзменении()
	ТекущиеДанныеНоменклатуры = Элементы.СписокНоменклатуры.ТекущиеДанные;
	ТекущиеДанныеНоменклатуры.Сумма = ТекущиеДанныеНоменклатуры.Цена * ТекущиеДанныеНоменклатуры.Количество; 
	Объект.СуммаПоДокументу = Объект.СписокНоменклатуры.Итог("Сумма");
КонецПроцедуры

&НаКлиенте
Процедура СписокНоменклатурыПриНачалеРедактирования(Элемент, НоваяСтрока, Копирование)
	Если Копирование Тогда 
		Объект.СуммаПоДокументу = Объект.СписокНоменклатуры.Итог("Сумма");
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура СписокНоменклатурыПослеУдаления(Элемент)
	Объект.СуммаПоДокументу = Объект.СписокНоменклатуры.Итог("Сумма");
КонецПроцедуры
