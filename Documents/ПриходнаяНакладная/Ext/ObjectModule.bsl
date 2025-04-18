﻿Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	
	// Если данные загружаются из другой базы, то не выполняем пересчет
	Если ОбменДанными.Загрузка Тогда
		Возврат;
	КонецЕсли;
	
	// Расчет суммы по документу как итог по колонке "Сумма" в табличной части "СписокНоменклатуры"
	СуммаПоДокументу = СписокНоменклатуры.Итог("Сумма");
	
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)
	// Если документ не проводится, то выходим
	Если НЕ Проведен Тогда
		Возврат;
	КонецЕсли;
	
	// Очищаем движения документа по регистру ОстаткиНоменклатуры
	Движения.ОстаткиНоменклатуры.Записывать = Истина;
	
	// Копируем табличную часть во временную таблицу
	СгруппированныеСтроки = СписокНоменклатуры.Выгрузить();
	
	// Сворачиваем данные по номенклатуре, суммируя количество
	СгруппированныеСтроки.Свернуть("Номенклатура", "Количество");
	
	// Формируем движения по регистру ОстаткиНоменклатуры на основе сгруппированных данных
	Для Каждого СгруппированнаяСтрока Из СгруппированныеСтроки Цикл
		// Создаем движение типа "Приход"
		Движение = Движения.ОстаткиНоменклатуры.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Номенклатура = СгруппированнаяСтрока.Номенклатура;
		Движение.Склад = Склад;
		Движение.Количество = СгруппированнаяСтрока.Количество;
	КонецЦикла;
	
КонецПроцедуры