let date = new Date();

const renderCalendar = () => {

	const selectYear = +getParameterByName('year');
	const selectMonth = +getParameterByName('month');
	
	let viewYear = date.getFullYear();			// 현재 년도
	let viewMonth = date.getMonth()+1;			// 현재 월

	if (selectYear != "" || selectMonth != "")	// selectYear와 selectMonth에 값이 있다면
	{
		viewYear = selectYear;					// viewYear를 selectYear로 변경
		viewMonth = selectMonth;				// viewMonth를 selectMonth로 변경
		
		if (viewMonth<1)						// viewMonth가 1보다 작을경우
		{
			viewMonth = 12;						// viewMonth를 12로 변경
			--viewYear;							// viewYear를 1만큼 감소 (이전 년도로)
		}
		
		if (viewMonth>12)						// viewMonth가 12보다 클경우
		{
			viewMonth = 1;						// viewMonth를 1로 변경
			++viewYear;							// viewYear를 1만큼 증가 (이후 년도로)
		}
		
	}
	
	// 달력에 년도, 월 표시
	document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth}월`;
	
	// viewYear과 viewMonth 값을 id가 year, month인곳의 value값에 입력
	document.getElementById("year").value = viewYear;
	document.getElementById("month").value = viewMonth;
	
	// date에 0을 전달하면 지난달의 마지막 날의 Date 객체가 생성
	const prevLast = new Date(viewYear, viewMonth-1, 0);		// 지난 달 마지막 날짜와 요일
	const thisLast = new Date(viewYear, viewMonth, 0);	// 이번 달 마지막 날짜와 요일
	
	const PLDate = prevLast.getDate();	// 지난 달 마지막 날짜
	const PLDay = prevLast.getDay();	// 지난 달 마지막 요일
	
	const TLDate = thisLast.getDate();	// 이번 달 마지막 날짜
	const TLDay = thisLast.getDay();	// 이번 달 마지막 요일
	
	const prevDates = [];										// 지난 달 날짜 배열
	const thisDates = [...Array(TLDate + 1).keys()].slice(1);	// 이번 달 날짜 배열
	const nextDates = [];										// 다음 달 날짜 배열
	
	if (PLDay !== 6)	// 지난 달 마지막 요일이 토요일(6)이 아니라면
	{
		// 지난달 마지막 요일부터 역순으로 배열 채우기
		for (let i = 0; i < PLDay + 1; i++)
		{
			prevDates.unshift(PLDate - i);
		}
	}
	
	// 이번달 마지막 요일부터 순서대로 배열 채우기
	for (let i = 1; i < 7 - TLDay; i++)
	{
		nextDates.push(i);
	}
	
	// 배열 합치기 (지난 달, 이번 달, 다음 달)
	const dates = prevDates.concat(thisDates, nextDates);
	
	// 이번 달 1일, 마지막날의 배열 위치 찾기 (투명도를 구분짓기 위함)
	const firstDateIndex = dates.indexOf(1);
	const lastDateIndex = dates.lastIndexOf(TLDate);
	
	let viewDate = [];	// 날짜를 담을 배열 선언
	for (var i = 1; i <= thisDates.length; i++)	// 이번달 날짜의 갯수만큼 반복해서 배열에 날짜 담기
	{
		viewDate[i-1] = viewYear + '-' + viewMonth + '-' + i;
	}
	
	let jsonStr = document.getElementById("json").value;
	
	let json = JSON.parse(jsonStr);
	
	//화살표 함수를 이용하여 각각의 배열을 html 코드로 수정
	dates.forEach((date, i) => 
	{
		if (i >= firstDateIndex && i < lastDateIndex + 1)
		{
			dates[i] = `<div class="date ajaxClick"><span class="this">${date}<input type="hidden" value="${viewDate[i-firstDateIndex]}"></input><div class="rsvBox">`;
			
			for (var j = 0; j < Object.keys(json).length; j++)
			{
				if(json[j].category == "강좌" && json[j].rsvDate == `${viewDate[i-firstDateIndex]}`)
				{
					dates[i] += `<div class="classBox"></div>`;
				}
				
				if(json[j].category == "원데이" && json[j].rsvDate == `${viewDate[i-firstDateIndex]}`)
				{
					dates[i] += `<div class="onedayBox"></div>`;
				}
			}
			
			dates[i] += `</div></span></div>`;
			
		}
		else
		{
			dates[i] = `<div class="date"><span class="other">${date}</span></div>`;
		}
	})
	
	// .dates 태그에 join 메소드를 이용하여 배열값 할당
	document.querySelector('.dates').innerHTML = dates.join('');
	
	// 오늘 날짜에 today 클래스 추가
	const today = new Date();
	if (viewMonth === (today.getMonth()+1) && viewYear === today.getFullYear())
	{
		for (let date of document.querySelectorAll('.this'))
		{
			if (+date.innerText === today.getDate())	// 『+』 : 문자를 숫자로 변경
			{
				date.classList.add('today');
				break;
			}
		}
	}

}

renderCalendar();


// 이전 달로 이동
const prevMonth = () =>
{
	date.setDate(1);																					// date를 1일로
	
	var year = document.getElementById("year").value;													// year 값을 가져오기
	var month = parseInt(document.getElementById("month").value, 10)-1;									// month 값을 가져와 -1
	var urlLink = document.getElementById("urlLink").value;	
	
	$(location).attr("href", urlLink + "?year=" + year + "&month=" + month + "#here");					// urlLink, year, month를 넘겨주면서 here 위치로
}

// 다음 달로 이동
const nextMonth = () =>
{
	date.setDate(1);																					// date를 1일로
	
	var year = document.getElementById("year").value;													// year 값을 가져오기
	var month = parseInt(document.getElementById("month").value, 10)+1;									// month 값을 가져와 +1
	var urlLink = document.getElementById("urlLink").value;	
	
	$(location).attr("href", urlLink + "?year=" + year + "&month=" + month + "#here");					// urlLink, year, month를 넘겨주면서 here 위치로
}

// 현재 일로 이동
const goToday = () =>
{
	date = new Date();
	renderCalendar();
	var urlLink = document.getElementById("urlLink").value;	
	
	$(location).attr("href", urlLink + "#here");
}

// url 파라미터값 추출 함수
function getParameterByName(name)
{
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
