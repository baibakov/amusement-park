
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОписаниеПеременных

#КонецОбласти

#Область ПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиСобытий

// Код процедур и функций
Процедура ОбработкаПроведения(Отказ,Режим)
	// регистр АктивныеПосещения
	Движения.АктивныеПосещения.Записывать = Истина;
	Движение = Движения.АктивныеПосещения.Добавить();
	Движение.Период = Дата;
	Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
	Движение.Основание = Основание;
	Движение.Аттракцион = Аттракцион;
	Движение.КоличествоПосещений = 1;
	
	Движения.Записать();
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	АктивныеПосещенияОстатки.Основание
		|ИЗ
		|	РегистрНакопления.АктивныеПосещения.Остатки(, Основание = &Основание) КАК АктивныеПосещенияОстатки
		|ГДЕ
		|	АктивныеПосещенияОстатки.КоличествоПосещенийОстаток < 0";
		
	Запрос.УстановитьПараметр("Основание", Основание);
	
	Если Не Запрос.Выполнить().Пустой() Тогда
		Отказ = Истина;
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = "По одному билету можно проходить только 1 раз!";
		Сообщение.УстановитьДанные(ЭтотОбъект);
		Сообщение.Поле = "Основание";
		Сообщение.Сообщить();
	КонецЕсли;
	
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Код процедур и функций

#КонецОбласти

#Область Инициализация

#КонецОбласти

#КонецЕсли
