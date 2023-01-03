using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance;
    public GameState State;
    public static event Action<GameState> OnGameStateChanged;
    
    void Awake() {
        Instance = this;
    }

    void Start() {
    }
   
   public void UpdateGameState(GameState newState) {
        State = newState;

        switch (newState)
        {
            case GameState.Word:
                break;
            case GameState.Level:
                break;
            default:
                break;
        }
        OnGameStateChanged?.Invoke(newState);  
   }

    public enum GameState {
        Word,
        Level,
    }
}
