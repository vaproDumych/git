<?php
$_['heading_title'] = 'Блог';
$_['heading_title_avatar'] = 'Аватар';
$_['entry_comment'] = 'Ваш відгук:';
$_['text_customer_enter'] = 'Ввійти';
$_['text_welcome'] = 'або <a href="%s"> зареєструватися </a>';
$_['text_wait'] = 'Зачекайте ...';
$_['text_all_begin'] = 'Всі ';
$_['text_all_end'] = '...';
$_['text_anonymus'] = 'Гість';
$_['text_sc_loading'] = 'Завантажується';
$_['text_avatar'] = 'Аватар';
$_['url_module_text'] = 'Модуль iБлог';
$_['url_blog_text'] = 'Категорії блогу';
$_['url_record_text'] = 'Записи';
$_['url_comment_text'] = 'Відгуки';
$_['url_forum_buy_text'] = 'Отримати тех. підтримку ';
$_['url_forum_update_text'] = 'Отримати поновлення';
$_['url_forum_text'] = 'Тих. підтримка модуля ';
$_['url_forum_site_text'] = 'Форум';
$_['url_opencartadmin_text'] = 'Про модулі';
$_['url_forum_buy'] = 'https://opencartforum.com/files/file/2371-seo-cms-top-2-blog-novosti-otzyvy-galereya-formy/';
$_['url_forum'] = 'https://opencartforum.com/topic/45395-seo-cms-top-2-blog-novosti-otzyvy-galereya-formy/';
$_['url_opencartadmin'] = 'https://opencartadmin.com';
$_['url_avatar_text'] = 'Змінити аватар';
$_['button_continue'] = "Далі";
$_['entry_ans'] = 'Ваш відповідь:';
$_['entry_rating'] = 'Оцініть публікацію:';
$_['entry_rating_review'] = 'Дайте оцінку:';
$_['entry_captcha_title'] = 'Тест на & laquo; людяність & raquo;';
$_['entry_captcha'] = 'Введіть послідовність символів, <br> які ви бачите на зображенні:';
$_['text_success'] = 'Дякуємо, ми передзвонимо вам по вказаному телефону і зазначений час';
$_['entry_minus'] = 'Жахливо';
$_['entry_bad'] = 'Погано';
$_['entry_normal'] = 'Задовільно';
$_['entry_good'] = 'Добре';
$_['entry_exelent'] = 'Відмінно';

$_['button_continue'] = 'Продовжити';
$_['error_text'] = 'Текст відгуку повинен бути від 3 до 1000 символів!';
$_['text_or_email'] = "Або e-mail для підписки";
$_['text_access_denided'] = "У вас немає прав доступу, ви повинні увійти під своїм ім'ям або зареєструватися";
$_['text_upload_allowed'] = 'Дозволені для завантаження типи файлів:';
$_['text_avatar_dim'] = 'Аватар матиме розмір:';
$_['text_upload'] = 'Файл успішно завантажений';
$_['entry_avatar_delete'] = 'Аватар видалено';
$_['text_signer'] = 'Підписатися на нові відгуки';
$_['text_limit'] = 'На сторінці:';
$_['text_sort'] = 'Сортувати по:';

$_['text_category_record'] = 'Категорія:';
$_['text_category'] = 'Категорія товару:';
$_['text_author'] = 'Автор:';

$_['entry_captcha_title'] = 'Тест на & laquo; людяність & raquo;';
$_['entry_captcha_update'] = 'Оновити';
$_['entry_captcha'] = 'Введіть послідовність символів, <br> які ви бачите на зображенні:';
$_['text_note'] = '<span style = "color: # FF0000;"> Увага: </ span> HTML не підтримується! Використовуйте звичайний текст. ';
$_['entry_captcha_update'] = 'Оновити';

$_['text_buy'] = 'Купував на сайті.';
$_['text_buyproduct'] = 'Купив цей товар.';
$_['text_registered'] = 'З нами.';

$_['error_filename'] = 'Чи не правильне імя файлу';
$_['error_filetype'] = 'Чи не правильний тип файлу';
$_['error_upload'] = 'Помилка завантаження файлу';

$_['text_for_category'] = 'За категоріями';
$_['text_for_childcategory'] = 'з підкатегоріями';
$_['text_for_desc'] = 'за описом';
$_['text_for_search'] = 'Пошук';


if (!isset($_['text_separator'])) {
	$_['text_separator']        = ' &raquo; ';
}

$_['text_customer_enter'] = 'Ввійти';
$_['text_welcome'] = 'або <a href="%s"> зареєструватися </a>';
$_['text_search'] = 'Пошук';
$_['text_ans'] = 'Варіанти відповідей';
$_['text_youans'] = 'Свій варіант відповіді';
$_['text_writeans'] = 'Залишити свій варіант відповіді';
$_['text_signer_answer'] = 'Отримувати відповіді';

if (SC_VERSION > 15) {
	$image_envelope = '<i class="fa fa-envelope" aria-hidden="true"></i>';
} else {
	$image_envelope = '';
}

$_['text_signer_answer_email'] = 'на e-mail <span class = "no-public"> (не публікується) </ span>'.$image_envelope;
$_['signer_answer_require'] = 'Заповніть поле: '.$_['text_signer_answer'];
$_['text_unpublic'] = '<span class = "no-public"> (Не буде опубліковано) </ span>';
$_['text_buy'] = 'Купував на сайті.';
$_['text_buyproduct'] = 'Купив цей товар.';
$_['text_registered'] = 'З нами.';
$_['text_buy_ghost'] = 'Гість.';
$_['text_admin'] = 'Адміністратор.';
$_['error_reg'] = '<div> Відгуки можуть залишати тільки зареєстровані користувачі. <br> ласка <a href="%s"> зареєструйтеся </a> </ div>';
$_['error_text'] = 'Текст відгуку повинен бути від 3 до 1000 символів!';
$_['error_rating'] = 'Будь ласка, виберіть оцінку!';
$_['error_captcha'] = 'Код, вказаний на зображенні, введений невірно!';
$_['text_review_karma'] = 'Чи є відгук корисним? ';
$_['text_review_yes'] = 'Так';
$_['text_review_no'] = "Ні";
$_['text_reply_button'] = 'Відповісти';
$_['text_write'] = 'Залишити відгук';
$_['text_write_review'] = 'Залишити відгук';
$_['text_error_email'] = 'Чи не правильний e-mail';
$_['text_no_comments'] = 'Ще ніхто не залишив відгуків.';
$_['text_edit_button'] = 'Редагувати';
$_['text_delete_button'] = 'Видалити';
$_['text_share'] = 'Поділитися';
$_['text_success'] = 'Дякуємо за Ваш відгук. Він відправлений адміністратору на затвердження. ';
$_['text_success_now'] = 'Дякуємо за Ваш відгук.';
$_['text_voted'] = 'Ви вже голосували!';
$_['text_vote_reg'] = 'Для того щоб проголосувати ви повинні увійти під своїми обліковими даними або зареєструватися';
$_['text_vote_self'] = 'За свої відгуки голосувати не можна';
$_['text_vote_blog_minus'] = 'Не подобається';
$_['text_vote_blog_plus'] = 'Подобається';
$_['text_all'] = 'Всього';
$_['text_voted_blog_plus'] = 'Ви проголосували позитивно.';
$_['text_voted_blog_minus'] = 'Ви проголосували негативно.';
$_['text_vote_will_reg'] = 'Голосувати можуть тільки зареєстровані користувачі';
$_['text_upload'] = 'Файл успішно завантажений на сервер!';
$_['text_wait'] = 'Зачекайте будь ласка!';

$_['text_anonymus'] = 'Гість';
$_['text_sorting_desc'] = 'нові cверху';
$_['text_sorting_asc'] = 'старі cверху';
$_['text_rollup'] = 'згорнути гілку';
$_['text_rollup_down'] = 'розгорнути гілку';
$_['entry_name'] = 'Ваше імя:';
$_['entry_comment'] = 'Ваш відгук:';

$_['entry_addfields_begin'] = 'Вкажіть:';
$_['entry_addfields_end'] = 'товару';
$_['entry_ans'] = 'Ваш відповідь:';
$_['entry_rating'] = 'Оцініть публікацію:';
$_['entry_rating_review'] = 'Дайте оцінку:';
$_['entry_minus'] = 'Жахливо';
$_['entry_bad'] = 'Погано';
$_['entry_normal'] = 'Задовільно';
$_['entry_good'] = 'Добре';
$_['entry_exelent'] = 'Відмінно';
$_['entry_captcha_update'] = 'Оновити';
$_['entry_sorting'] = 'метод відгуки';
$_['entry_sortingans'] = 'метод відповіді';

$_['error_validate'] = 'доступі';

$_['text_sc_stat_reviews'] = 'відгуків';
$_['text_sc_stat_answer'] = 'відповідей';
$_['text_sc_stat_ratings'] = 'оцінок';
$_['text_sc_stat_good'] = 'позитивних';
$_['text_sc_stat_rate_text'] = 'Корисність відгуків';
$_['text_sc_stat_rate'] = 'голосів';