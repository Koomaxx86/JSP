/**
 * 유효성 검사 
 */
	// 제품
	function checkProduct() {
		let form = document.product
		let productId = form.productId
		let name = form.name
		let unitPrice = form.unitPrice
		let unitsInStock = form.unitsInStock
		
		let msg = ''
		
		let productIdCheck = /^P[0-9]{6}$/
		msg = '상품 아이디는 "P6자리" 로 입력해주세요'
		if( !check(productIdCheck, productId, msg) ) return false
		
		let nameCheck = /^.{2,20}$/
		msg = '상품명은 2~20자 이내로 입력해주세요'
		if( !check(nameCheck, name, msg) ) return false
		
		let priceCheck = /^\d{1,}$/
		msg = '가격은 1글자 이상의 숫자로 입력해주세요'
		if( !check(priceCheck, unitPrice, msg) ) return false
		
		let stockCheck = /^\d{1,}$/
		msg = '재고는 1글자 이상의 숫자로 입력해주세요'
		if( !check(stockCheck, unitsInStock, msg) ) return false
		
		return true
	}
	
	// 회원
	function checkUser() {
		let password = document.getElementById('pw').value;
		let passwordCheck = document.getElementById('pwcheck').value;

		let form = document.joinForm
		let pw = form.pw
		let birth = form.birth
		let tel = form.tel
		
		let msg = ''
				
		if(password != passwordCheck) {
		alert('비밀번호가 일치하지 않습니다.');
		return false;
		} 
		
		let pwCheck = /^.{8,20}$/
		msg = '비밀번호는 8~20자 사이로 입력해주세요'
		if( !check(pwCheck, pw, msg) ) return false
		
		let birthCheck = /^\d{4}-\d{2}-\d{2}$/
		msg = '생년월일은 YYYY-MM-DD 형식으로 입력해주세요'
		if( !check(birthCheck, birth, msg) ) return false
		
		let telCheck = /^\d{3}-\d{3,4}-\d{4}$/
		msg = '휴대폰 번호로 입력해주세요(xxx-xxxx-xxxx)'
		if( !check(telCheck, tel, msg) ) return false
		
		return true
	}

	// 정규표현식 유효성 검사 함수
	function check(regExp, element, msg) {
		
		if( regExp.test(element.value)) {			
			return true
		}
		
		alert(msg)
		element.select()
		element.focus()
		return false
	}