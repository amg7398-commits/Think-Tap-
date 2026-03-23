////
////  InstructionCard.swift
////  ThinkTap
////
////  Created by Hussein Alzailaei on 2/9/26.
////
//
//
//struct InstructionCard: View {
//
//    var title: String
//    var icon: String
//    var color: Color
//    var text: String
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 15) {
//
//            HStack {
//                Image(systemName: icon)
//                    .font(.title2)
//                    .foregroundColor(color)
//
//                Text(title)
//                    .font(.title2.bold())
//            }
//
//            Text(text)
//                .font(.body)
//                .foregroundColor(.black.opacity(0.8))
//                .fixedSize(horizontal: false, vertical: true)
//
//        }
//        .padding()
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color.white)
//                .shadow(color: .black.opacity(0.10), radius: 6, x: 0, y: 4)
//        )
//    }
//}
