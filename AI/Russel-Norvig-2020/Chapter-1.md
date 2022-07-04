- [Chapter 1: Introduction](#chapter-1-introduction)
  - [1.1 What is AI?](#11-what-is-ai)
    - [1.1.1 Acting humanly: The Turing test approach](#111-acting-humanly-the-turing-test-approach)
    - [1.1.2 Thinking humanly: The cognitive modeling approach](#112-thinking-humanly-the-cognitive-modeling-approach)
    - [1.1.3 Thinking rationally: The "laws of thought" approach](#113-thinking-rationally-the-laws-of-thought-approach)
    - [1.1.4 Acting rationally: The rational agent approach](#114-acting-rationally-the-rational-agent-approach)
    - [1.1.5 Beneficial machines](#115-beneficial-machines)
  - [1.2 The Foundations of Artificial Intelligence](#12-the-foundations-of-artificial-intelligence)


---
# Chapter 1: Introduction

> The field of **artificial intelligence**, or AI,is concerned with not just understanding but also *building* intelligent entities—machines that can compute how to act effectively and safely in a wide variety of novel situations.
 
## 1.1 What is AI?

> Historically, researchers have pursued several different versions of AI. Some have defined intelligence in terms of fidelity to human performance, while others prefer an abstract, formal definition of intelligence called rationality—loosely speaking, doing the “right thing.” The subject matter itself also varies: some consider intelligence to be a property of internal thought processes and reasoning, while others focus on intelligent behavior, an external characterization.

> From these two dimensions—human vs. rational and thought vs. behavior—there are four possible combinations [...]

### 1.1.1 Acting humanly: The Turing test approach

> The **Turing test** [...] was designed as a thought experiment that would sidestep the philosophical vagueness of the question "Can a machine think?"

> A computer passes the test if a human interrogator, after posing some written questions, can't tell whether the written responses come from a person or from a computer.

There are variants of the Turing test, such as the **total Turing test** which requires interactions with objects and people in the real world.

### 1.1.2 Thinking humanly: The cognitive modeling approach

> To say that a program thinks like a human, we must know how humans think.

> Once we have a sufficiently precise theory of the mind, it becomes possible to express the theory as a computer program. If the program’s input–output behavior matches corresponding human behavior, that is evidence that some of the program’s mechanisms could also be operating in humans.

### 1.1.3 Thinking rationally: The "laws of thought" approach

> The Greek philosopher Aristotle was one of the first to attempt to codify “right thinking”— that is, irrefutable reasoning processes. His **syllogisms** provided patterns for argument structures that always yielded correct conclusions when given correct premises.

> Logic as conventionally understood requires knowledge of the world that is certain— a condition that, in reality, is seldom achieved. [...] The **theory of probability** fills this gap, allowing rigorous reasoning with uncertain information.

> In principle, it allows the construction of a comprehensive model of rational thought, leading from raw perceptual information to an understanding of how the world works to predictions about the future. What it does not do, is generate intelligent behavior. For that, we need a theory of rational action. Rational thought, by itself, is not enough.
 
### 1.1.4 Acting rationally: The rational agent approach

An **agent** is something that acts. A **rational agent** is one that acts so as to achieve the best outcome (or the best expected outcome).

> In the “laws of thought” approach [...] the emphasis was on correct inferences. Making correct inferences is sometimes part of being a rational agent [...]. On the other hand, there are ways of acting rationally that cannot be said to involve inference. For example [...] a reflex action.

> All the skills needed for the Turing test also allow an agent to act rationally.

The rational-agent approach has prevailed throughout most of the fields history. 

> In a nutshell, AI has focused on the study and construction of agents that do the right thing.

What counts as the right thing is defined by the objective that we provide to the agent. This general paradigm is so pervasive that we might call it the **standard model**.

However, it is important to note that perfect rationality is not feasible in complex environments. Still, it is a good starting point fot theoretical analysis.

### 1.1.5 Beneficial machines

> The standard model has been a useful guide for AI research since its inception, but it is probably not the right model in the long run. The reason is that the standard model assumes that we will supply a fully specified objective to the machine.

> The problem of achieving agreement between our true preferences and the objective we put into the machine is called the **value alignment problem**: the values or objectives put into the machine must be aligned with those of the human.

> It is impossible to anticipate all the ways in which a machine pursuing a fixed objective might misbehave. There is good reason, then, to think that the standard model is inadequate. We don’t want machines that are intelligent in the sense of pursuing their objectives; we want them to pursue our objectives. If we cannot transfer those objectives perfectly to the machine, then we need a new formulation—one in which the machine is pursuing our objectives, but is necessarily uncertain as to what they are. When a machine knows that it doesn’t know the complete objective, it has an incentive to act cautiously, to ask permission, to learn more about our preferences through observation, and to defer to human control. Ultimately, we want agents that are **provably beneficial** to humans. 

## 1.2 The Foundations of Artificial Intelligence

- Philosophy: Can formal rules be used to draw valid conclusions? does the mind arise from physical brain? where does knowledge come from? how does knowledge leads to action?
- Mathematics: what are the formal rules to draw valid conclusions? what can be computed? how do we reason with uncertainty?
- Economics: how should we make decisions in accordance to our preferences? how should we do this when others don't go along? how should we do this when the payoff may be far in the future?
- Neuroscience: how do brains process information?
- Psychology: how do human and animals think and act?
- Computer engineering: how can we build an efficient computer?
- Control theory and cybernetics: how can artifacts operate under their own control?
- Linguistics: how does language relate to thought?
