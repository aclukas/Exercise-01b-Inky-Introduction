/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 * Basic Choices
 * Knot structure
 * Recurring choices
 * Conditionals in descriptions
 * Conditionals in choices
 
 In the assignment:
 - Add four more knots (and feel free to change any of the example text, this is YOUR story)
 - Add at least one more conditional
*/

-> cave_mouth

== cave_mouth ==
You are at the entrance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.
+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. {not key_pickup:It is very dark, you can't see anything.}
* {torch_pickup} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

==west_tunnel ==
You are in the west tunnel. A couple of small torches illuminate the room. Ahead of you is a wooden door.
+ [Open the door] -> locked_door
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
You are in the east tunnel. {not key_pickup:The light of your torch glints off of a small, golden key.}
*[Pick up the key] -> key_pickup
+ [Go Back] -> cave_mouth
-> END

== key_pickup ==
You now have a key.
+[Go Back] -> east_tunnel_lit
-> END

== locked_door ==
The door is locked.
* {key_pickup} [Use Key]-> unlocked_door
+ [Go Back] -> west_tunnel
-> END

== unlocked_door ==
You open the door and walk through, feeling a gust of wind behind you. As you turn around you realize too late that the door has disappeared.
->new_room

== new_room ==
Ahead of you are two paths--one to the right and one to the left. There is no choice but to go deeper into the cave.
+ [Take the right path] -> right_path
+ [Take the left path] -> left_path

==right_path ==
As you wander forwad, the path becomes darker and darker. You hear a strange rumbling sound and the floor begins to vibrate.
-> dead

==left_path ==
You venture farther into the cave, eventually stumbling into a small room overflowing with gold. On the other side is a staircase.
->good_ending

== dead ==
You are squashed by a giant boulder.
-> END

== good_ending ==
You grab all the gold you could possibly carry and being to climb the staircase. After a while, you reach the surface again. The path behind you disappears and you live the rest of your life happy, healthy, and filthy rich.
->END