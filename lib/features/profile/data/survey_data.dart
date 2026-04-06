import 'package:ztech_hpih_app/features/profile/domain/models/survey_item.dart';

class SurveyData {
  // ── Màn 1: Dinh dưỡng ──────────────────────────────────────────
  static const nutritionSurvey = SurveyConfig(
    title: 'Dinh dưỡng',
    questions: [
      SurveyQuestion(
        question: 'Ông/bà/anh/chị ăn bao nhiêu bữa chính một ngày?',
        options: ['1 bữa chính', '2 bữa chính', '3 bữa chính', 'Khác'],
      ),
      SurveyQuestion(
        question:
            'Ngoài bữa chính ra, ông/bà/anh/chị có ăn/uống bữa phụ không?',
        options: ['Có', 'Thỉnh thoảng', 'Không'],
      ),
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có đang theo chế độ ăn đặc biệt nào không?',
        options: ['Ăn chay', 'Ăn keto/detox', 'Ăn low-carb', 'Chế độ khác'],
      ),
      SurveyQuestion(
        question: 'Trong tuần vừa qua, ông/bà/anh/chị có ăn trái cây không?',
        options: ['Có', 'Không'],
      ),
    ],
  );

  // ── Màn 2: Vận động ─────────────────────────────────────────────
  static const exerciseSurvey = SurveyConfig(
    title: 'Vận động',
    questions: [
      SurveyQuestion(
        question:
            'Trong tuần vừa qua, ông/bà/anh/chị có tập thể dục hoặc vận động ít nhất 30 phút mỗi ngày không?',
        options: ['Có', 'Thỉnh thoảng', 'Không'],
      ),
      SurveyQuestion(
        question: 'Ông/bà/anh/chị thường vận động bao nhiêu ngày trong tuần?',
        options: ['0 ngày', '1-2 ngày', '3-5 ngày', '6-7 ngày'],
      ),
      SurveyQuestion(
        question: 'Hình thức vận động chính của ông/bà/anh/chị là gì?',
        options: ['Đi bộ', 'Tập thể dục nhẹ', 'Chơi thể thao', 'Khác'],
      ),
      SurveyQuestion(
        question: 'Sau khi vận động, ông/bà/anh/chị cảm thấy thế nào?',
        options: ['Khỏe hơn', 'Bình thường', 'Mệt', 'Khó trả lời'],
      ),
    ],
  );

  static const sleepSurvey = SurveyConfig(
    title: 'Giấc ngủ',
    questions: [
      SurveyQuestion(
        question: 'Ông/bà/anh/chị thường ngủ bao nhiêu tiếng mỗi đêm?',
        options: ['Dưới 5 tiếng', '5-6 tiếng', '7-8 tiếng', 'Trên 8 tiếng'],
      ),
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có khó ngủ hoặc thức giấc giữa đêm không?',
        options: ['Thường xuyên', 'Thỉnh thoảng', 'Hiếm khi', 'Không'],
      ),
      SurveyQuestion(
        question: 'Sau khi ngủ dậy, ông/bà/anh/chị cảm thấy thế nào?',
        options: ['Tỉnh táo', 'Bình thường', 'Mệt mỏi', 'Buồn ngủ'],
      ),
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có ngủ trưa không?',
        options: ['Có, thường xuyên', 'Thỉnh thoảng', 'Không'],
      ),
    ],
  );
  static const activitySurvey = SurveyConfig(
    title: 'Hoạt động hằng ngày',
    questions: [
      SurveyQuestion(
        question:
            'Trong một ngày, ông/bà/anh/chị ngồi hoặc nằm nghỉ bao lâu, không tính lúc ngủ?',
        options: ['Dưới 4 giờ', '4-6 giờ', '7-9 giờ', 'Trên 9 giờ'],
      ),
      SurveyQuestion(
        question:
            'Ông/bà/anh/chị có đi bộ hoặc di chuyển trong sinh hoạt hằng ngày không?',
        options: ['Nhiều', 'Vừa phải', 'Ít', 'Hầu như không'],
      ),
      SurveyQuestion(
        question: 'Ông/bà/anh/chị thường sử dụng phương tiện nào khi đi lại?',
        options: ['Đi bộ/xe đạp', 'Xe máy', 'Ô tô', 'Khác'],
      ),
      SurveyQuestion(
        question:
            'Ông/bà/anh/chị có làm việc nhà hoặc hoạt động chân tay không?',
        options: ['Thường xuyên', 'Thỉnh thoảng', 'Hiếm khi', 'Không'],
      ),
    ],
  );
  static const mentalSurvey = SurveyConfig(
    title: 'Tâm lý',
    questions: [
      SurveyQuestion(
        question:
            'Trong 2 tuần vừa qua, ông/bà/anh/chị có thường cảm thấy buồn chán hoặc mất hứng thú không?',
        options: ['Thường xuyên', 'Thỉnh thoảng', 'Hiếm khi', 'Không'],
      ),
      SurveyQuestion(
        question:
            'Ông/bà/anh/chị có thường cảm thấy lo lắng, căng thẳng hoặc bồn chồn không?',
        options: ['Thường xuyên', 'Thỉnh thoảng', 'Hiếm khi', 'Không'],
      ),
      SurveyQuestion(
        question: 'Khi gặp khó khăn, ông/bà/anh/chị có người để chia sẻ không?',
        options: ['Có', 'Đôi khi', 'Hiếm khi', 'Không'],
      ),
      SurveyQuestion(
        question:
            'Ông/bà/anh/chị tự đánh giá tinh thần hiện tại của mình thế nào?',
        options: ['Tốt', 'Bình thường', 'Không tốt', 'Rất mệt mỏi'],
      ),
    ],
  );
  static const smokingSurvey = SurveyConfig(
    title: 'Thuốc lá',
    questions: [
      SurveyQuestion(
        question: 'Ông/bà/anh/chị hiện có hút thuốc lá không?',
        options: ['Đang hút', 'Đã bỏ', 'Chưa từng hút'],
      ),
      SurveyQuestion(
        question: 'Nếu có, ông/bà/anh/chị hút bao nhiêu điếu mỗi ngày?',
        options: ['Dưới 5 điếu', '5-10 điếu', 'Trên 10 điếu', 'Không hút'],
      ),
      SurveyQuestion(
        question: 'Ông/bà/anh/chị đã hút thuốc trong bao lâu?',
        options: ['Dưới 1 năm', '1-5 năm', 'Trên 5 năm', 'Không hút'],
      ),
      SurveyQuestion(
        question:
            'Ông/bà/anh/chị có thường xuyên tiếp xúc với khói thuốc không?',
        options: ['Thường xuyên', 'Thỉnh thoảng', 'Hiếm khi', 'Không'],
      ),
    ],
  );
  static const drinkingSurvey = SurveyConfig(
    title: 'Uống rượu bia',
    questions: [
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có uống rượu, bia hoặc đồ uống có cồn không?',
        options: ['Thường xuyên', 'Thỉnh thoảng', 'Hiếm khi', 'Không'],
      ),
      SurveyQuestion(
        question: 'Trung bình mỗi tuần, ông/bà/anh/chị uống bao nhiêu lần?',
        options: ['0 lần', '1-2 lần', '3-4 lần', 'Trên 4 lần'],
      ),
      SurveyQuestion(
        question: 'Mỗi lần uống, ông/bà/anh/chị thường dùng bao nhiêu?',
        options: ['Ít', 'Vừa phải', 'Nhiều', 'Không uống'],
      ),
      SurveyQuestion(
        question:
            'Sau khi uống, ông/bà/anh/chị có thấy ảnh hưởng đến sức khỏe không?',
        options: ['Có', 'Thỉnh thoảng', 'Không rõ', 'Không'],
      ),
    ],
  );

  static const allergyHistorySurvey = SurveyConfig(
    title: 'Tiền sử dị ứng',
    questions: [
      SurveyQuestion(
        question: 'Ông/bà/anh/chị đã từng bị dị ứng trước đây chưa?',
        options: ['Có', 'Không', 'Không nhớ'],
      ),
      SurveyQuestion(
        question: 'Phản ứng dị ứng trước đây của ông/bà/anh/chị thường ở mức nào?',
        options: ['Nhẹ', 'Trung bình', 'Nặng', 'Chưa từng bị'],
      ),
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có từng phải nhập viện vì dị ứng không?',
        options: ['Có', 'Không'],
      ),
      SurveyQuestion(
        question: 'Hiện tại ông/bà/anh/chị có theo dõi hoặc điều trị dị ứng không?',
        options: ['Có', 'Không', 'Thỉnh thoảng'],
      ),
    ],
  );

  static const allergyFoodSurvey = SurveyConfig(
    title: 'Dị ứng thực phẩm',
    questions: [
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có bị dị ứng với thực phẩm nào không?',
        options: ['Có', 'Không', 'Không rõ'],
      ),
      SurveyQuestion(
        question: 'Khi ăn thực phẩm lạ, ông/bà/anh/chị có từng nổi mẩn hoặc khó chịu không?',
        options: ['Thường xuyên', 'Thỉnh thoảng', 'Không'],
      ),
      SurveyQuestion(
        question: 'Triệu chứng dị ứng thực phẩm của ông/bà/anh/chị thường là gì?',
        options: ['Nổi mẩn/ngứa', 'Đau bụng/nôn', 'Khó thở', 'Chưa từng bị'],
      ),
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có chủ động tránh một số loại thực phẩm không?',
        options: ['Có', 'Không', 'Thỉnh thoảng'],
      ),
    ],
  );

  static const allergyMedicineSurvey = SurveyConfig(
    title: 'Dị ứng thuốc',
    questions: [
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có từng bị dị ứng thuốc không?',
        options: ['Có', 'Không', 'Không nhớ'],
      ),
      SurveyQuestion(
        question: 'Sau khi dùng thuốc, ông/bà/anh/chị có từng bị nổi mẩn hoặc khó thở không?',
        options: ['Có', 'Không', 'Không rõ'],
      ),
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có nhớ rõ loại thuốc từng gây dị ứng không?',
        options: ['Có', 'Không', 'Chưa từng bị'],
      ),
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có báo với bác sĩ về tiền sử dị ứng thuốc không?',
        options: ['Luôn luôn', 'Đôi khi', 'Chưa từng', 'Không áp dụng'],
      ),
    ],
  );

  static const allergySkinSurvey = SurveyConfig(
    title: 'Dị ứng da',
    questions: [
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có hay bị ngứa, nổi mẩn hoặc kích ứng da không?',
        options: ['Thường xuyên', 'Thỉnh thoảng', 'Hiếm khi', 'Không'],
      ),
      SurveyQuestion(
        question: 'Da của ông/bà/anh/chị có dễ kích ứng với mỹ phẩm hoặc hóa chất không?',
        options: ['Có', 'Không', 'Không rõ'],
      ),
      SurveyQuestion(
        question: 'Khi bị dị ứng da, ông/bà/anh/chị thường làm gì?',
        options: ['Tự xử lý', 'Dùng thuốc', 'Đi khám', 'Chưa từng bị'],
      ),
      SurveyQuestion(
        question: 'Tình trạng dị ứng da có tái phát nhiều lần không?',
        options: ['Có', 'Không', 'Không rõ'],
      ),
    ],
  );

  static const allergyEnvironmentSurvey = SurveyConfig(
    title: 'Dị ứng môi trường',
    questions: [
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có dị ứng với bụi, phấn hoa hoặc lông động vật không?',
        options: ['Có', 'Không', 'Không rõ'],
      ),
      SurveyQuestion(
        question: 'Khi thay đổi thời tiết, ông/bà/anh/chị có dễ hắt hơi hoặc ngứa mũi không?',
        options: ['Thường xuyên', 'Thỉnh thoảng', 'Không'],
      ),
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có bị khó chịu khi ở môi trường nhiều khói hoặc bụi không?',
        options: ['Có', 'Không', 'Thỉnh thoảng'],
      ),
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có biện pháp phòng tránh tác nhân dị ứng môi trường không?',
        options: ['Có', 'Không', 'Thỉnh thoảng'],
      ),
    ],
  );

  static const allergyOtherSurvey = SurveyConfig(
    title: 'Dị ứng khác',
    questions: [
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có dị ứng với yếu tố nào khác ngoài thực phẩm, thuốc và môi trường không?',
        options: ['Có', 'Không', 'Không rõ'],
      ),
      SurveyQuestion(
        question: 'Phản ứng dị ứng khác của ông/bà/anh/chị thường xuất hiện như thế nào?',
        options: ['Nhẹ', 'Trung bình', 'Nặng', 'Chưa từng bị'],
      ),
      SurveyQuestion(
        question: 'Ông/bà/anh/chị có biết rõ tác nhân gây dị ứng đó không?',
        options: ['Có', 'Không', 'Chưa chắc'],
      ),
      SurveyQuestion(
        question: 'Tình trạng dị ứng khác này có ảnh hưởng nhiều đến sinh hoạt không?',
        options: ['Có', 'Ít', 'Không', 'Không áp dụng'],
      ),
    ],
  );

  static SurveyConfig allergySurveyByType(String type) {
    switch (type) {
      case 'history':
        return allergyHistorySurvey;
      case 'food':
        return allergyFoodSurvey;
      case 'medicine':
        return allergyMedicineSurvey;
      case 'skin':
        return allergySkinSurvey;
      case 'environment':
        return allergyEnvironmentSurvey;
      case 'other':
        return allergyOtherSurvey;
      default:
        return allergyHistorySurvey;
    }
  }
}
