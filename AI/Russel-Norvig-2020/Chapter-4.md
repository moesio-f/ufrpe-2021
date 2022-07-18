- [Chapter 4: Search in Complex Environments](#chapter-4-search-in-complex-environments)
  - [4.1 Local Search and Optimization Problems](#41-local-search-and-optimization-problems)
    - [4.1.1 Hill-climbing search](#411-hill-climbing-search)
    - [4.1.2 Simulated annealing](#412-simulated-annealing)
    - [4.1.3 Local beam search](#413-local-beam-search)
    - [4.1.4 Evolutionary algorithms](#414-evolutionary-algorithms)
  - [4.2 Local Search in Continuous Spaces](#42-local-search-in-continuous-spaces)

---
# Chapter 4: Search in Complex Environments

> In which we relax the simplifying assumptions of the previous chapter, to get closer to the real world.

## 4.1 Local Search and Optimization Problems

> **Local search algorithms** operate by searching from a start state to neighboring states, without keeping track of the paths, nor the set of states that have been reached. That means they are not systematic.
> 
> Local search algorithms can also solve **optimization** problems, in which the aim is to find the best state according to an *objective function*.

### 4.1.1 Hill-climbing search

> The **hill-climbing search algorithm** [...] keeps track of one current state and on each iteration moves to the neighboring state with highest value that is, it heads in the direction that provides the **steepest ascent**.

This algorithm is sometimes called **greedy local search**, since it grabs a good neighbor state without considering ahead of that state. Some situations might get stuck:

- **Local maxima**
- **Ridges**
- **Plateaus**

### 4.1.2 Simulated annealing

> **Annealing** is the process used to temper or harden metals and glass by heating them to a high temperature and then gradually cooling them, thus allowing the material to reach a low-energy crystalline state.

In summary, the simulated annealing takes random moves and updates its state if the move improves the situation or it accepts this move with some probability. This probability decreases exponentially with the "badness" of the move. It also decreases as the temperature goes down.

### 4.1.3 Local beam search

> The local beam search algorithm keeps track of $k$ states rather than just one. It begins with $k$ randomly generated states. At each step, all the successors of all $k$ states are generated. If any one is a goal, the algorithm halts. Otherwise, it selects the $k$ best successors from the complete list and repeats.

### 4.1.4 Evolutionary algorithms

> **Evolutionary algorithms** can be seen as variants of stochastic beam search that are explicitly motivated by the metaphor of natural selection in biology: there is a population of individuals
(states), in which the fittest (highest value) individuals produce offspring (successor states) that populate the next generation, a process called **recombination**.

## 4.2 Local Search in Continuous Spaces

>  A continuous action space has an infinite branching factor, and thus can’t be handled by most of the algorithms we have covered so far (with the exception of first-choice hill climbing and simulated annealing).

Continuous spaces can be handled by classic algorithms through *discretization*.

> Often we have an objective function expressed in a mathematical form such that we can use calculus to solve the problem analytically rather than empirically. Many methods attempt to use the gradient of the landscape to find a maximum. The gradient of the objective function is a vector $\nabla f$ that gives the magnitude and direction of the steepest slope.

> An optimization problem is **constrained** if solutions must satisfy some hard constraints on the values of the variables.

Linear programming problems constraints must be linear inequalities forming a **convex set**.  It is a special case of the more general problem of **convex optimization**, which allows the constraint region to be any convex region and the objective to be any function that is convex within the constraint region. 