<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="lt" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="wg" tagdir="/WEB-INF/tags/widget" %>
<%@taglib prefix="ce" tagdir="/WEB-INF/tags/application/basics/lists-and-keys" %>
<%@taglib prefix="app" tagdir="/WEB-INF/tags/application" %>

<lt:layout cssClass="page hello-world-example-page">
	<wg:head size="3"><b>2.9	Списки и ключи</b></wg:head>

	<wg:p>Сперва давайте посмотрим как можно преобразовывать списки в JavaScript.</wg:p>

	<wg:p>В данном коде ниже мы используем функцию <code>map()</code> чтобы принять массив
		<code>numbers</code> и помножить на 10 его значения. Мы присваиваем новый массив,
		возвращенный методом <code>map()</code> переменной <code>result</code> и логируем ее:</wg:p>

	<ce:code-example-1/>

	<wg:p>Этот  код логирует  [10, 20, 30, 40, 50, 60, 70, 80, 90] в консоль</wg:p>

	<wg:p>В React, преобразование массивов в списки элементов почти идентично.</wg:p>

	<br/>
	<wg:head size="4"><b>2.9.1	Отрисовка группы компонентов</b></wg:head>

	<wg:p>Вы можете создавать коллекции элементов и включать их в JSX. Используя фигурные скобки.</wg:p>

	<wg:p>Ниже, мы проходимся в цикле по массиву <code>users</code>, используя JavaScript
		<code>map()</code> функцию. Мы возвращаем элемент <code>&lt;li&gt;</code> для каждого элемента
		массива. В итоге мы присваиваем результирующий массив элементов переменной <code>items</code>:</wg:p>

	<ce:code-example-2/>

	<wg:p>Мы включаем весь массив <code>items</code> внутри элемента
		<code>&lt;ul&gt;</code> и отрисовываем его в DOM:</wg:p>

	<ce:code-example-3 codePenUrl="https://codepen.io/stzidane/pen/dRPBvN?editors=0010"/>

	<wg:p>Этот код отображает маркированный список всех пользователей.</wg:p>

	<br/>
	<wg:head size="4"><b>2.9.2	Базовый компонент списка</b></wg:head>

	<wg:p>В большинстве случаев вы бы отрисовывали списки внутри компонента.</wg:p>

	<wg:p>Мы можем отрефакторить предыдущий пример и выделить компонент, который
		принимает массив <code>users</code> и выводит несортированный список элементов</wg:p>

	<ce:code-example-4/>

	<wg:p>Когда вы выполните этот код, вы получите предупреждение, что ключ <code>key</code> должен быть
		предоставлен для элементов списка. «Keys» - это специальные строковые атрибуты, которые
		вы должны добавить, когда создаете список элементов. Мы обсудим, почему это так важно в следующем разделе.</wg:p>

	<wg:p>Давайте присвоим ключ <code>key</code> к элементам нашего списка внутри <code>numbers.map()</code> и
		исправим проблему пропущенных ключей:</wg:p>

	<ce:code-example-5 codePenUrl="https://codepen.io/stzidane/pen/dRPBWv?editors=0010"/>

	<br/>
	<wg:head size="4"><b>2.9.3	Ключи</b></wg:head>

	<wg:p>Ключи помогают React идентифицировать, какой элемент был изменен, добавлен или удален.
		Ключи должны быть предоставлены элементам внутри массива, чтобы дать элементам
		стабильную идентифицируемость:</wg:p>

	<ce:code-example-6/>

	<wg:p>Лучший способ выбрать ключи – использовать строку, которая уникально  идентифицирует
		элемент списка среди его соседей. Чаще всего вы должны использовать ID из ваших данных как ключи:</wg:p>

	<ce:code-example-7/>

	<wg:p>Когда у вас нет стабильных ID для отрисовки элементов, в крайнем случае вы
		можете использовать индекс элемента как ключ:</wg:p>

	<ce:code-example-8/>

	<%--todo сделать ссылку на свой сайт--%>
	<wg:p>Мы не рекомендуем использовать индексы для ключей, если элементы могут
		переупорядочиваться, так как это будет медленным. Вы можете
		прочитать <wg:link href="https://facebook.github.io/react/docs/reconciliation.html#recursing-on-children">более
			глубокое объяснение</wg:link> о том, почему ключи необходимы, если вам интересно.</wg:p>

	<br/>
	<wg:head size="4"><b>2.9.4	Выделение компонентов с ключами</b></wg:head>

	<wg:p>Ключи имеют смысл только в контексте окружающего массива.</wg:p>

	<wg:p>К примеру, если вы выделяете компонент <code>UserItem</code>, вам следует поставить
		ключ на элементы <code>&lt;UserItem /&gt;</code> в массиве, вместо того чтобы ставить его
		на корневой элемент <code>&lt;li&gt;</code>.</wg:p>

	<wg:p>Пример <b>неправильного</b> использования ключей:</wg:p>

	<ce:code-example-9/>

	<wg:p>Пример <b>правильного</b> использования ключей:</wg:p>

	<ce:code-example-10 codePenUrl="https://codepen.io/stzidane/pen/GEgbbX?editors=0010"/>

	<wg:p>Хорошим эмпирическим правилом является то, что <b>элементы внутри
		вызова</b> <code>map()</code> <b>требуют ключи</b>.</wg:p>

	<br/>
	<wg:head size="4"><b>2.9.5	Ключи должны быть уникальными только в пределах соседей</b></wg:head>

	<wg:p>Ключи использующиеся вместе с массивами должны быть уникальными только в пределах их
		соседей. Тем не менее, они не требуют быть уникальными глобально. Вы можете использовать
		те же самые ключи, когда производите два различных массива:</wg:p>

	<ce:code-example-11 codePenUrl="https://codepen.io/stzidane/pen/BZyXKe?editors=0010"/>

	<wg:p>Ключи служат как подсказки React, но они не передаются в ваши компоненты. Если
		вам нужно то же самое значение в вашем компоненте, передайте его напрямую как свойство с другим именем:</wg:p>

	<ce:code-example-12/>

	<wg:p>В примере выше, компонент <code>Message</code> может читать <code>props.id</code>,
		но не <code>props.key</code>.</wg:p>

	<br/>
	<wg:head size="4"><b>2.9.6	Встраивание map() в JSX</b></wg:head>

	<wg:p>В примерах выше мы объявляли отдельную переменную <code>items</code> и включали ее в JSX:</wg:p>

	<ce:code-example-13/>

	<wg:p>JSX позволяет встраивать любое выражение в фигурные скобки,
		поэтому мы могли бы встроить результат вызова  <code>map()</code>:</wg:p>

	<ce:code-example-14/>

	<wg:p>Иногда это приводит к более чистому коду, но этим стилем можно и злоупотреблять.
		Как и в JavaScript,  вам решать, является ли это хуже вынесения кода в переменную с
		точки зрения читабельности. Имейте ввиду, что если тело <code>map()</code> имеет слишком много вложений,
		возможно, наступило отличное время выделить компонент.</wg:p>
</lt:layout>