#include "player.hh"

#include <vector>
#include <iostream>

Player::Player(){
    mTransform.scale(-1,1);

}
void Player::updatePlayer()
{
    switch (mCurrentState) {
    case PlayerState::Stand:
        // set current speed to zeros
        mCurrentSpeed = {0,0};
        Penguin::standAnimation(mTransform);
        // process stand
        // if player is not on the ground, then change current state to Jump
        if (! mOnGround){
            mCurrentState = PlayerState::Jump;
            break;
        }
        if (keyState(KeyInput::GoLeft) != keyState(KeyInput::GoRight)){
            mCurrentState = PlayerState::Walk;
            break;
        } else if (keyState(KeyInput::Jump)){
            mCurrentState = PlayerState::Jump;
            mCurrentSpeed.setY(mJumpSpeed);
            break;
        }
        break;
    case PlayerState::Walk:
        // player walk animation...
        Penguin::walkAnimation(mTransform);
        // press or not press go left or go right at the same time
        if (keyState(KeyInput::GoLeft) == keyState(KeyInput::GoRight)){
            mCurrentState = PlayerState::Stand;
            mCurrentSpeed = {0,0};
            break;
        }
        else if(keyState(KeyInput::GoRight)){
            if (mPushesRightWall){
                mCurrentSpeed.setX(0);
            }else{
                mCurrentSpeed.setX(mWalkSpeed);

            }
        }
        else if(keyState(KeyInput::GoLeft)){
            if (mPushesLeftWall){
                mCurrentSpeed.setX(0);
            }else{
                mCurrentSpeed.setX(-mWalkSpeed);

            }
        }
        if (keyState(KeyInput::Jump)){
            mCurrentSpeed.setY(mJumpSpeed);
            mCurrentState = PlayerState::Jump;
            break;
        }
        else if(!mOnGround){
            mCurrentState = PlayerState::Jump;
            break;
        }
        break;

    case PlayerState::Jump:
        // play jump animation
        Penguin::jumpAnimation(mTransform);
        mCurrentSpeed.setY(mCurrentSpeed.y() + cGravity);
        // limit the falling speed
        mCurrentSpeed.setY(std::min(mCurrentSpeed.y(), cMaxFallingSpeed));
        // if short press the jump key
        if(!keyState(KeyInput::Jump) && mCurrentSpeed.y() < 0){
            mCurrentSpeed.setY(std::max(mCurrentSpeed.y(), cMinJumpSpeed));

        }
        if (keyState(KeyInput::GoLeft) == keyState(KeyInput::GoRight)){
            mCurrentSpeed.setX(0);
        }
        else if(keyState(KeyInput::GoRight)){
            if (mPushesRightWall){
                mCurrentSpeed.setX(0);
            }else{
                mCurrentSpeed.setX(mWalkSpeed);

            }
        }
        else if(keyState(KeyInput::GoLeft)){
            if (mPushesLeftWall){
                mCurrentSpeed.setX(0);
            }else{
                mCurrentSpeed.setX(-mWalkSpeed);

            }
        }
        // if hit the ground
        if (mOnGround){
            // if no movement, then state equals to stand
            if (keyState(KeyInput::GoLeft) == keyState(KeyInput::GoRight)){
                mCurrentState = PlayerState::Stand;
                mCurrentSpeed = {0,0};
                // play the music of hitting the ground...

            }else{
                mCurrentState = PlayerState::Walk;
                mCurrentSpeed.setY(0);
            }
        }
        // if hit the ceiling, immediately change vertical speed to zero and fall
        if (mAtCeiling){
            mCurrentSpeed.setY(cGravity);
        }
        break;
    case PlayerState::Attack:
        if (Penguin::mFrameIndex > Penguin::ATTACK_FRAME -1){
            changeState(PlayerState::Jump);
        }
        Penguin::attackAnimation(mTransform);
        break;
    case PlayerState::Die:
        Penguin::dieAnimation(mTransform);
        if (Penguin::mFrameIndex > Penguin::DIE_FRAME -1){
            changeState(PlayerState::Jump);
        }
        break;
    }

    // check collision and update physics info ...
    updatePhysics();

    updatePreviousInput();

}

void Player::changeDirection(Player::PlayerDirection direction)
{
    if (direction != mCurrentDirection){
        mCurrentDirection = direction;
        mTransform.scale(-1,1);
    }

}
