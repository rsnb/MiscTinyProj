(* Pig dice game in Ocaml *)

open Random

let () = Random.self_init ()

let roll_d6 () =
  Random.int 6 + 1

let roll_d6 () =
  let roll = roll_d6 () in
    print_string "Rolled a ";
    print_int roll;
    print_endline "";
    roll

let user_roll_again () =
  print_endline "Roll again? (y for yes)";
  read_line () = "y"

let rec play_round so_far roll_again =
  match roll_again with
  | false -> so_far
  | true -> let roll = roll_d6 () in
    (match roll with
    | 1 -> 0
    | _ ->  print_string "Total so far is: ";
            print_int (so_far + roll);
            print_endline "";
            play_round (so_far + roll) (user_roll_again ()))

let rec play_game is_player1_turn score_a score_b =
  let current_player = if is_player1_turn then "Player 1" else "Player 2" in
    print_endline "";
    print_endline (current_player ^ "'s Turn with score " ^ string_of_int score_a);
    match play_round 0 true with
    | score when (score_a + score) >= 100
      -> print_endline (current_player ^ " Wins!")
    | score -> play_game (not is_player1_turn) score_b (score_a + score)


let () =
  play_game true 0 0
