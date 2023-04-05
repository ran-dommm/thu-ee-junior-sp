.data
filename: .asciiz "test.dat"
buffer:   .space  4100
##### You may add more code HERE if necessary #####

.text
main:
# Open file
la   $a0, filename  # load filename
li   $a1, 0         # flag
li   $a2, 0         # mode
li   $v0, 13        # open file syscall index
syscall

# Read file
move $a0, $v0       # load file description to $a0
la   $a1, buffer    # buffer address
li   $a2, 4100      # buffer size
li   $v0, 14        # read file syscall index
syscall

# Close file
li   $v0, 16        # close file syscall index
syscall

# Parameters
la   $t0, buffer
lw   $s0, 0($t0)    # set $s0 to n
move $a0, $s0       # set $a0 to n
addi $a1, $t0, 4    # set $a1 to &graph

# Call Dijkstra
jal  dijkstra

# Print results
li   $t0, 1
la   $t1, dist
print_entry:
addi $t1, $t1, 4
lw   $a0, 0($t1)
li   $v0, 1         # print int syscall index
syscall
li   $a0, ' '
li   $v0, 11        # print char syscall index
syscall
addi $t0, $t0, 1
blt  $t0, $s0, print_entry

# Return 0
li   $a0, 0
li   $v0, 17
syscall

dijkstra:
##### YOUR CODE HERE #####
