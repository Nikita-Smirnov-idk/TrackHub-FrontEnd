import SwiftUI
import AVKit
import Combine

// Обёртка для видео с обработкой состояний, аналогичной AsyncImage
struct VideoPlayerWrapper: View {
    let player: AVPlayer
    @State private var phase: VideoPhase = .empty

    enum VideoPhase {
        case empty
        case success
        case failure(Error?)
    }
    
    var body: some View {
        ZStack {
            switch phase {
            case .empty:
                ProgressView() // Индикатор загрузки
            case .success:
                VideoPlayer(player: player)
                    .onAppear {
                        player.play() // Запуск видео при появлении
                    }
                    .onDisappear {
                        player.pause() // Остановка видео при скрытии
                    }
            case .failure:
                // Заглушка при ошибке
                Image(systemName: "video.slash.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.gray)
            }
        }
        .onReceive(playerStatusPublisher) { status in
            switch status {
            case .unknown:
                phase = .empty
            case .readyToPlay:
                phase = .success
            case .failed:
                phase = .failure(player.currentItem?.error)
            @unknown default:
                phase = .failure(nil)
            }
        }
    }
    
    private var playerStatusPublisher: AnyPublisher<AVPlayerItem.Status, Never> {
        if let currentItem = player.currentItem {
            return currentItem.publisher(for: \.status)
                .replaceError(with: .unknown)
                .eraseToAnyPublisher()
        } else {
            return Just(AVPlayerItem.Status.unknown).eraseToAnyPublisher()
        }
    }
}

// Основной экран упражнения
struct ExerciseFullScreenView: View {
    @StateObject var dataSource = DataSource()
    @State private var isExpandedInstructions: Bool = true
    var exercise: Exercise
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .center) {
                            // Превью упражнения
//                            if let imageURL = URL(string: exercise.preview) {
//                                AsyncImage(url: imageURL) { phase in
//                                    switch phase {
//                                    case .empty:
//                                        ProgressView() // Индикатор загрузки
//                                    case .success(let image):
//                                        image.resizable()
//                                             .aspectRatio(contentMode: .fit)
//                                    case .failure:
//                                        Image(systemName: "photo") // Заглушка при ошибке
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                            .foregroundColor(.gray)
//                                    @unknown default:
//                                        EmptyView()
//                                    }
//                                }
//                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.3)
//                            } else {
//                                Text("Неверный URL для превью")
//                            }
                            
                            // Название упражнения
                            Text(exercise.name)
                                .font(.custom("ReadexPro-Bold", size: 28))
                                .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.leading)
                            
                            // Описание упражнения
                            DisclosureGroup("Описание") {
                                Text(exercise.description)
                                    .font(.custom("ReadexPro-Bold", size: 16))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                    .padding(.leading)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                            Divider()
                                .background(Color(dataSource.selectedTheme.primaryColor))
                            
                            // Статистика: подходы, повторения, время отдыха
                            HStack(spacing: 20) {
                                VStack {
                                    Text("Подходы")
                                        .font(.custom("ReadexPro-Bold", size: 16))
                                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                    Text("\(exercise.sets)")
                                        .font(.custom("ReadexPro-Bold", size: 23))
                                        .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                }
                                VStack {
                                    Text("Повторения")
                                        .font(.custom("ReadexPro-Bold", size: 16))
                                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                    Text("\(exercise.reps)")
                                        .font(.custom("ReadexPro-Bold", size: 23))
                                        .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                }
                                VStack {
                                    Text("Время отдыха")
                                        .font(.custom("ReadexPro-Bold", size: 16))
                                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                    Text("\(exercise.restTime)")
                                        .font(.custom("ReadexPro-Bold", size: 23))
                                        .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                }
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(dataSource.selectedTheme.primaryColor), lineWidth: 2)
                                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.1)
                            )
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            
                            Divider()
                                .background(Color(dataSource.selectedTheme.primaryColor))
                            
                            // Группы мышц
                            VStack(alignment: .leading) {
                                HStack(spacing: 5) {
                                    Image(systemName: "figure")
                                        .resizable()
                                        .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                        .frame(width: geometry.size.width * 0.05, height: geometry.size.width * 0.05)
                                    Text("Группы мышц")
                                        .font(.custom("ReadexPro-Bold", size: 18))
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                }
                                .padding(.leading)
                                TagsView(tags: exercise.targetMuscle, geometry: geometry)
                            }
                            .padding()
                            
                            Divider()
                                .background(Color(dataSource.selectedTheme.primaryColor))
                            
                            // Оборудование
                            VStack(alignment: .leading) {
                                HStack(spacing: 5) {
                                    Image(systemName: "dumbbell")
                                        .resizable()
                                        .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                        .frame(width: geometry.size.width * 0.08, height: geometry.size.width * 0.05)
                                    Text("Оборудование")
                                        .font(.custom("ReadexPro-Bold", size: 18))
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                                }
                                .padding(.leading)
                                TagsView(tags: exercise.gymEquipment, geometry: geometry)
                            }
                            .padding()
                            
                            Divider()
                                .background(Color(dataSource.selectedTheme.primaryColor))
                            
//                            // Видео с обработкой состояний
//                            if let videoURL = URL(string: exercise.vidoe) {
//                                let player = AVPlayer(url: videoURL)
//                                VideoPlayerWrapper(player: player)
//                                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.3)
//                            } else {
//                                Text("Ошибка: неверный URL видео")
//                                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.3)
//                            }
                            
//                            Divider()
//                                .background(Color(dataSource.selectedTheme.primaryColor))
                            
                            // Инструкция по выполнению
                            VStack(alignment: .leading) {
                                DisclosureGroup("Инструкция по выполнению", isExpanded: $isExpandedInstructions) {
                                    instructionView(instructions: exercise.instructions, geometry: geometry)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                        }
                        .frame(width: geometry.size.width)
                    }
                    
                    // Пример кнопки (CardFullScreenButton) поверх содержимого
                    CardFullScreenButton(dataSource: dataSource, geometry: geometry)
                }
            }
            .background(Color(dataSource.selectedTheme.backgroundColor))
            .accentColor(Color(dataSource.selectedTheme.primaryColor))
        }
    }
    
    // Функция для отображения инструкций
    private func instructionView(instructions: [String], geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(instructions.indices, id: \.self) { index in
                let instruction = instructions[index]
                HStack(spacing: 10) {
                    Text("\(index + 1)")
                        .font(.custom("ReadexPro-Regular", size: 20))
                        .foregroundColor(Color(dataSource.selectedTheme.backgroundColor))
                        .frame(width: 30, height: 30)
                        .background(Circle().fill(Color(dataSource.selectedTheme.primaryColor)))
                        .overlay(Circle().stroke(Color(dataSource.selectedTheme.primaryColor), lineWidth: 2))
                        .multilineTextAlignment(.center)
                    Text(instruction)
                        .font(.custom("ReadexPro-Regular", size: 16))
                        .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color(dataSource.selectedTheme.buttonsBackgroundColor))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(dataSource.selectedTheme.secondaryBackgroundColor), lineWidth: 2)
                )
            }
        }
        .frame(maxWidth: geometry.size.width * 0.9, alignment: .leading)
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(dataSource.selectedTheme.primaryColor), lineWidth: 2)
        )
        .padding()
    }
}

// MARK: - Предварительный просмотр
//
//struct ExerciseFullScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseFullScreenView(
//            exercise: Exercise(
//                id: 0,
//                name: "Приседы",
//                description: "Приседы епта",
//                targetMuscle: ["Ягодицы", "Квадрицепс"],
//                gymEquipment: ["Тренажер Смитта"],
//                instructions: ["Подойдите к тренажеру", "Нажмите на кнопку начать", "Выполняйте", "Думайте о жизни"],
//                preview: "https://picsum.photos/300",
//                vidoe: "https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4",
//                sets: 4,
//                reps: 12,
//                restTime: 60,
//                createdAt: "10.20.20",
//                createdBy: "никита смирнов"
//            )
//        )
//    }
//}
