//
//  OpenAIProtocol+Combine.swift
//  
//
//  Created by Sergii Kryvoblotskyi on 03/04/2023.
//

#if canImport(Combine)

import Combine

@available(iOS 13.0, *)
@available(tvOS 13.0, *)
@available(macOS 10.15, *)
@available(watchOS 6.0, *)
public extension OpenAIProtocol {

    func completions(query: CompletionsQuery) -> AnyPublisher<(CompletionsResult, [AnyHashable: Any]?), Error> {
        Future<(CompletionsResult, [AnyHashable: Any]?), Error> {
            completions(query: query, completion: $0)
        }
        .eraseToAnyPublisher()
    }
    
    func completionsStream(query: CompletionsQuery) -> AnyPublisher<Result<CompletionsResult, Error>, Error> {
        let progress = PassthroughSubject<Result<CompletionsResult, Error>, Error>()
        completionsStream(query: query) { result in
            progress.send(result)
        } completion: { error in
            if let error {
                progress.send(completion: .failure(error))
            } else {
                progress.send(completion: .finished)
            }
        }
        return progress.eraseToAnyPublisher()
    }

    func images(query: ImagesQuery) -> AnyPublisher<(ImagesResult, [AnyHashable: Any]?), Error> {
        Future<(ImagesResult, [AnyHashable: Any]?), Error> {
            images(query: query, completion: $0)
        }
        .eraseToAnyPublisher()
    }
    
    func imageEdits(query: ImageEditsQuery) -> AnyPublisher<(ImagesResult, [AnyHashable: Any]?), Error> {
        Future<(ImagesResult, [AnyHashable: Any]?), Error> {
            imageEdits(query: query, completion: $0)
        }
        .eraseToAnyPublisher()
    }
    
    func imageVariations(query: ImageVariationsQuery) -> AnyPublisher<(ImagesResult, [AnyHashable: Any]?), Error> {
        Future<(ImagesResult, [AnyHashable: Any]?), Error> {
            imageVariations(query: query, completion: $0)
        }
        .eraseToAnyPublisher()
    }

    func embeddings(query: EmbeddingsQuery) -> AnyPublisher<(EmbeddingsResult, [AnyHashable: Any]?), Error> {
        Future<(EmbeddingsResult, [AnyHashable: Any]?), Error> {
            embeddings(query: query, completion: $0)
        }
        .eraseToAnyPublisher()
    }

    func chats(query: ChatQuery) -> AnyPublisher<(ChatResult, [AnyHashable: Any]?), Error> {
        Future<(ChatResult, [AnyHashable: Any]?), Error> {
            chats(query: query, completion: $0)
        }
        .eraseToAnyPublisher()
    }
    // TODO:
    func chatsStream(query: ChatQuery) -> AnyPublisher<Result<ChatStreamResult, Error>, Error> {
        let progress = PassthroughSubject<Result<ChatStreamResult, Error>, Error>()
        chatsStream(query: query) { result in
            progress.send(result)
        } completion: { error in
            if let error {
                progress.send(completion: .failure(error))
            } else {
                progress.send(completion: .finished)
            }
        }
        return progress.eraseToAnyPublisher()
    }
    
    func edits(query: EditsQuery) -> AnyPublisher<(EditsResult, [AnyHashable: Any]?), Error> {
        Future<(EditsResult, [AnyHashable: Any]?), Error> {
            edits(query: query, completion: $0)
        }
        .eraseToAnyPublisher()
    }
    
    func model(query: ModelQuery) -> AnyPublisher<(ModelResult, [AnyHashable: Any]?), Error> {
        Future<(ModelResult, [AnyHashable: Any]?), Error> {
            model(query: query, completion: $0)
        }
        .eraseToAnyPublisher()
    }
    
    func models() -> AnyPublisher<(ModelsResult, [AnyHashable: Any]?), Error> {
        Future<(ModelsResult, [AnyHashable: Any]?), Error> {
            models(completion: $0)
        }
        .eraseToAnyPublisher()
    }
    
    func moderations(query: ModerationsQuery) -> AnyPublisher<(ModerationsResult, [AnyHashable: Any]?), Error> {
        Future<(ModerationsResult, [AnyHashable: Any]?), Error> {
            moderations(query: query, completion: $0)
        }
        .eraseToAnyPublisher()
    }

    func audioTranscriptions(query: AudioTranscriptionQuery) -> AnyPublisher<(AudioTranscriptionResult, [AnyHashable: Any]?), Error> {
        Future<(AudioTranscriptionResult, [AnyHashable: Any]?), Error> {
            audioTranscriptions(query: query, completion: $0)
        }
        .eraseToAnyPublisher()
    }

    func audioTranslations(query: AudioTranslationQuery) -> AnyPublisher<(AudioTranslationResult, [AnyHashable: Any]?), Error> {
        Future<(AudioTranslationResult, [AnyHashable: Any]?), Error> {
            audioTranslations(query: query, completion: $0)
        }
        .eraseToAnyPublisher()
    }
}

#endif
