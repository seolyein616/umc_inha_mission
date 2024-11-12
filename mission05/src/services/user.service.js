import { responseFromUser } from "../dtos/user.dto.js";
import { 
    addUser, 
    getUser, 
    getUserPreferencesByUserId, 
    setPreference, 
    addStore, 
    addReview, 
    addMission, 
    acceptMission 
} from "../repositories/user.repository.js";

// User signup function
export const userSignUp = async (data) => {
    // Add user to the database
    const joinUserId = await addUser({
        id: data.id,
        email: data.email,
        name: data.name,
        gender: data.gender,
        age: data.age,
        address: data.address,
        address2: data.address2
    });

    if (joinUserId === null) {
        throw new Error("이미 존재하는 이메일입니다.");
    }

    // Set preferences concurrently
    await Promise.all(data.preference.map(preference => setPreference(joinUserId, preference)));

    // Retrieve user and preferences
    const user = await getUser(joinUserId);
    const preference = await getUserPreferencesByUserId(joinUserId);

    return responseFromUser({ user, preference });
};

// Add store to area
export const storeToArea = async (data) => {
    const newStoreId = await addStore({
        id: data.id,
        region_id: data.region_id,
        name: data.name,
        address: data.address,
    });
    if (newStoreId === null) {
      throw new Error("상점 추가에 실패했습니다. 요청을 확인해주세요.");
  }

    return { region_id: data.region_id, name: data.name };
};

// Add review to store
export const reviewToStore = async (data) => {
    const newReviewId = await addReview({
        id: data.id,
        store_id: data.store_id,
        name: data.name,
        text: data.text,
    });

    if (newReviewId === null) {
        throw new Error("존재하는 상점이 아닙니다.");
    }

    return { name: data.name, text: data.text };
};

// Add mission to store
export const missionToStore = async (data) => {
    const newMissionId = await addMission({
        id: data.id,
        store_id: data.store_id,
        mission_text: data.mission_text,
        reward: data.reward,
    });

    return { store_id: data.store_id, mission_text: data.mission_text, reward: data.reward };
};

// Accept mission
export const missionAccept = async (data) => {
    const acceptMissionId = await acceptMission({
        id: data.id,
        mission_id: data.mission_id,
        member_id: data.member_id, // Ensure that member_id or user_id is passed
    });

    if (acceptMissionId === null) {
        throw new Error("미션이 존재하지 않습니다.");
    }

    return { mission_id: data.mission_id };
};
