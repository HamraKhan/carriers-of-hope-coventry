
export function getMember(id) {
    if(id) {
        return selectMemberById(id)
    }
    return selectAllMembers()
}