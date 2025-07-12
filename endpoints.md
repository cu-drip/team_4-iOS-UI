GET /api/v1/tournir/list/{id} - Получить список турниров, на которые зарегистрирован участник по id участника

id: String
title: String?
description: String?
sport: String?
typeTournament: String?
typeGroup: String?
matchesNumbers: Int?
startTime: String?
createdAt: String?
entryCost: Double?
maxParticipants: Int?
registrationDeadline: String?
place: String?
organizedId: String?
tournirInstantState: String

POST /api/v1/tournir/{id} - Отправить информацию о турнире по его id при изменении состояния турнира

id: String
title: String?
description: String?
sport: String?
typeTournament: String?
typeGroup: String?
matchesNumbers: Int?
startTime: String?
createdAt: String?
entryCost: Double?
maxParticipants: Int?
registrationDeadline: String?
place: String?
organizedId: String?
tournirInstantState: String

GET /api/v1/MatchStats/{id} - Получить статистику матчей по id турнира

tournamentID: String
sport: String?
timePlayed: Double?
goals: Int?
assists: Int?
fouls: Int?
points: Int?
knockdowns: Int?
setsWon: Int?
yellowCards: Int?
pauses: Int?
winnerID: String?

POST /api/v1/MatchStats/{id} - Отправить статистику матчей по id турнира

tournamentID: String  (по нему ищите список участников турнира)
sport: String?
timePlayed: Double?
goals: Int?
assists: Int?
fouls: Int?
points: Int?
knockdowns: Int?
setsWon: Int?
yellowCards: Int?
pauses: Int?
wins: Int?
loses: Int?
winnerID: String?

GET /api/v1/user/stat/{id} - Получить общую статистику пользователя по его id
sport: String?
wins: Int?
loses: Int?
matches: Int?
bigWins: Int?
winrate: Int? (число 0-100)

GET /api/v1/tournir/set/{id(tournir)} – получение списка пар людей, которые будут соревноваться
id: String
title: String?
description: String?
sport: String?
typeTournament: String?
typeGroup: String?
matchesNumbers: Int?
startTime: String?
createdAt: String?
entryCost: Double?
maxParticipants: Int?
registrationDeadline: String?
place: String?
organizedId: String?
tournirInstantState: String

