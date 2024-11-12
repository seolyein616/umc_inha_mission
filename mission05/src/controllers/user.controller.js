import { StatusCodes } from "http-status-codes";
import { 
    bodyToUser,
    bodyToStore, 
    bodyToReview, 
    bodyToMission
} from "../dtos/user.dto.js";
import { 
    userSignUp,
    storeToArea,
    reviewToStore,
    missionToStore,
    missionAccept
} from "../services/user.service.js";

export const handleUserSignUp = async (req, res, next) => {
  try{  
    console.log("회원가입을 요청했습니다");
    console.log("body:", req.body);//값이 잘 들어오나 확인 용도
    
    const user = await userSignUp(bodyToUser(req.body));
    res.status(StatusCodes.OK).json({result: user });
  } catch (error) {
    console.error("회원가입 오류: ", error);
    next(error);
  }
};

export const handleStoreAdd = async (req, res, next) => {
    console.log("가계추가를 요청했습니다");
    console.log("controller body: ", req.body);

    const newStore = await storeToArea(bodyToStore(req.body));
    res.status(StatusCodes.OK).json({result: newStore});
};

export const handleReviewAdd = async (req, res, next) => {
    console.log("가게 리뷰 추가하기를 요청했습니다.");
    console.log("body: ", req.body);

    const newReview = await reviewToStore(bodyToReview(req.body));
    res.status(StatusCodes.OK).json({result: newReview});
};

export const handleNewMission = async (req, res, next) => {
    console.log("미션추가를 요청했습니다");
    console.log("body: ", req.body);

    const newMission = await missionToStore(bodyToMission(req.body));
    res.status(StatusCodes.OK).json({result: newMission});
};

export const handleMissionAccept = async (req, res, next) => {
    console.log("미션수락을 요청했습니다.");
    console.log("body: ", req.body);

    const missionAcception = await missionAccept(req.body);
    res.status(StatusCodes.OK).json({result: missionAcception});
};