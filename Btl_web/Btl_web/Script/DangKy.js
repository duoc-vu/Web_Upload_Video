function validateForm(event) {
    event.preventDefault(); // Ngăn chặn việc gửi form

    // Lấy giá trị username, email, password và repassword từ các ô input
    var usernameInput = document.getElementById('username');
    var username = usernameInput.value;
    var emailInput = document.getElementById('email');
    var email = emailInput.value;
    var passwordInput = document.getElementById('password');
    var password = passwordInput.value;
    var repasswordInput = document.getElementById('repassword');
    var repassword = repasswordInput.value;

    // Kiểm tra lỗi trống
    if (username.trim() === '') {
        document.getElementById('usernameError').textContent = 'Vui lòng nhập tên đăng nhập.';
        return;
    }

    if (email.trim() === '') {
        document.getElementById('emailError').textContent = 'Vui lòng nhập địa chỉ email.';
        return;
    }

    if (password.trim() === '') {
        document.getElementById('passwordError').textContent = 'Vui lòng nhập mật khẩu.';
        return;
    }

    if (repassword.trim() === '') {
        document.getElementById('passwordError').textContent = 'Vui lòng xác nhận mật khẩu.';
        return;
    }

    // Kiểm tra định dạng email
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        document.getElementById('emailError').textContent = 'Email không hợp lệ.';
        return;
    }

    // Kiểm tra lỗi ký tự đặc biệt trong username và email
    var specialChars = /[!#$%^&*()_+\-=\[\]{};':"\\|,<>\/?]+/;
    if (specialChars.test(username)) {
        document.getElementById('usernameError').textContent = 'Tên đăng nhập không được chứa ký tự đặc biệt.';
        return;
    }

    if (specialChars.test(email)) {
        document.getElementById('emailError').textContent = 'Email không được chứa ký tự đặc biệt.';
        return;
    }

    // Kiểm tra username có viết hoa chữ cái đầu
    var firstChar = username.charAt(0);
    if (firstChar !== firstChar.toUpperCase()) {
        document.getElementById('usernameError').textContent = 'Tên đăng nhập phải viết hoa chữ cái đầu.';
        return;
    }

    // Kiểm tra mật khẩu và xác nhận mật khẩu trùng khớp
    if (password !== repassword) {
        document.getElementById('passwordError').textContent = 'Mật khẩu không trùng khớp.';
        return;
    }

    // Gửi form nếu không có lỗi
    document.getElementById('registrationForm').submit();
}