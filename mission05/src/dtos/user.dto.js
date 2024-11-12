export const responseFromUser = (data, pref) => {
    return{
        email: data.email,
        name: data.name,
        preferCategory: pref.name,
    }
};

export const bodyToUser = (body) => {
    const birth = new Date(body.birth);

    return {
        id: body.id,
        email: body.email,
        name: body.name,
        gender: body.gender, 
        age: body.age,
        address: body.address || " ",
        address2: body.address2 || " ",
    };
};

export const bodyToStore = (body) => {
    return {
        id: body.id,
        region_id: body.region_id,
        name: body.name,
        address: body.address,
    };
};

export const bodyToReview = (body) => {
    return {
        id: body.id,
        store_id: body.store_id,
        name: body.name,
        text: body.text,
    };
};

export const bodyToMission = (body) => {
    return {
        id: body.id,
        store_id: body.store_id,
        mission_text: body.mission_text,
        reward: body.reward || "5",
    };
};