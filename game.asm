.data
    welcome:.string "\nWelcome to Antakshari Game!\n"
    p1_input:.string "\nPlayer 1's turn. Enter a word: "
    p2_input:.string "\nPlayer 2's turn. Enter a word: "
    p1_score:.string "\nPlayer 1's score: "
    p2_score:.string "\nPlayer 2's score: "
    draw_score:.string"\nGame is Draw\n"
    
    winner:.string "\nWinner is Player "
    invalid:.string "\nInvalid word! Word should start with '"
    invalid2:.string "'. Next player's turn.\n"
    
    round_msg:.string "\nRound "
    of_msg:.string " of 10\n"
    game_end:.string "\nGame Over! Final scores:\n"
    
    last_char:.byte 0
    p1_points:.word 0
    p2_points:.word 0
    
    rounds:.word 1 # Start from round 1
    newline:.byte '\n'
    word_buffer:.space 100

.text
    # Print welcome message
    la a0, welcome
    li a7, 4
    ecall

game_loop:
    # Check current round
    la t0, rounds
    lw t1, 0(t0)# Load current round
    li t2, 11 # Compare with 11 (after 10th round)
    bge t1, t2, final_results
    
    # Print current round
    la a0, round_msg
    li a7, 4
    ecall
    
    lw a0, 0(t0)# Print round number
    li a7, 1
    ecall
    
    la a0, of_msg
    li a7, 4
    ecall

player1_turn:
    la a0, p1_input
    li a7, 4
    ecall
    
    la t3, word_buffer
    mv t4, t3
    
read_p1_word:
    li a7, 12
    ecall
    li t2, '\n'
    beq a0, t2, p1_word_end
    sb a0, 0(t4)
    addi t4, t4, 1
    j read_p1_word
        
p1_word_end:
    sb zero, 0(t4)
   
    la t0, last_char
    lb t0, 0(t0)
    lb t1, 0(t3)
    beqz t0, p1_valid #first turn
    bne t0, t1, p1_invalid
    
p1_valid:
    addi t4, t4, -1
    lb t1, 0(t4)
    
    la t0, last_char#store last charcater
    sb t1, 0(t0)
    
    la t0, p1_points#increment points
    lw t1, 0(t0)
    addi t1, t1, 1
    sw t1, 0(t0)
    j player2_turn

p1_invalid:
    la a0, invalid
    li a7, 4
    ecall
    
    la t0, last_char#letter jo chahiye wo 
    lb a0, 0(t0)
    li a7, 11
    ecall
    
    la a0, invalid2
    li a7, 4
    ecall
    j player2_turn

player2_turn:
    la a0, p2_input
    li a7, 4
    ecall
    
    la t3, word_buffer
    mv t4, t3
    
read_p2_word:
    li a7, 12
    ecall
    li t2, '\n'
    beq a0, t2, p2_word_end
    sb a0, 0(t4)
    addi t4, t4, 1
    j read_p2_word
        
p2_word_end:
    sb zero, 0(t4)
    
    la t0, last_char
    lb t0, 0(t0)
    lb t1, 0(t3)
    bne t0, t1, p2_invalid
    
p2_valid:
    addi t4, t4, -1
    lb t1, 0(t4)
    
    la t0, last_char
    sb t1, 0(t0)
    
    la t0, p2_points
    lw t1, 0(t0)
    addi t1, t1, 1
    sw t1, 0(t0)
    j show_scores

p2_invalid:
    la a0, invalid
    li a7, 4
    ecall
    
    la t0, last_char
    lb a0, 0(t0)
    li a7, 11
    ecall
    
    la a0, invalid2
    li a7, 4
    ecall
    j show_scores

show_scores:
    # scores
    la a0, p1_score
    li a7, 4
    ecall
    la t0, p1_points
    lw a0, 0(t0)
    li a7, 1
    ecall
    
    la a0, p2_score
    li a7, 4
    ecall
    la t0, p2_points
    lw a0, 0(t0)
    li a7, 1
    ecall
    
    # Increment round number 
    la t0, rounds
    lw t1, 0(t0)
    addi t1, t1, 1# Increment round
    sw t1, 0(t0)
    
    j game_loop 

final_results:

    la t0, p1_points
    la t1, p2_points
    lw t0, 0(t0)
    lw t1, 0(t1)
    beq t0, t1, draw
    
    la a0, game_end
    li a7, 4
    ecall
    
    la a0, winner
    li a7, 4
    ecall
    
    
    bgt t0, t1, p1_wins
    
    
    li a0, 2 # Player 2 wins
    j print_winner
    
p1_wins:
    li a0, 1
    
print_winner:
    li a7, 1
    ecall
    
    la a0, newline
    li a7, 4
    ecall
    
    li a7, 10       
    ecall
draw:
    la a0,draw_score
    li a7,4
    ecall
