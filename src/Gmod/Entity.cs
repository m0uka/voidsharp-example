using System;

#pragma warning disable 0626

namespace VoidSharp {
    /// <summary>
    /// @CSharpLua.Ignore
    /// </summary>
    public abstract class Entity
    {

        public bool IsPlayer()
        {
            throw new NotImplementedException();
        }

        public bool IsValid()
        {
            throw new NotImplementedException();
        }

        public Player ToPlayer()
        {
            throw new NotImplementedException();
        }

        public int GetBoneCount()
        {
            throw new NotImplementedException();
        }

        public int EntIndex()
        {
            throw new NotImplementedException();
        }

        public string GetClass()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Returns the model of the entity.
        /// </summary>
        public string GetModel()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Sets the color of the entity
        /// </summary>
        public void SetColor(Color color) 
        {
            throw new NotImplementedException();
        }

        public Color GetColor()
        {
            throw new NotImplementedException();
        }

        public Vector GetPos()
        {
            throw new NotImplementedException();
        }

        public bool IsOnFire()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Ignites the entity.
        /// </summary>
        public void Ignite() 
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Extinguishes the entity.
        /// </summary>
        public void Extinguish()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Sets the position of the entity.
        /// </summary>
        /// <param name="pos">The desired position of the entity.</param>
        public void SetPos(Vector pos)
        {
            throw new NotImplementedException();
        }
    }
    
    /// <summary>
    /// @CSharpLua.Ignore
    /// </summary>
    public static class Ents
    {
        /// <summary>
        /// Returns all the entities.
        /// </summary>
        public static Entity[] GetAll()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Returns all the entities which have a class.
        /// </summary>
        /// <param name="str">The class name.</param>
        public static Entity[] FindByClass(string str)
        {
            throw new NotImplementedException();
        }
        
        /// <summary>
        /// Returns an Entity by it's ID
        /// </summary>
        /// <param name="id">The Entity ID</param>
        public static Entity GetById(int id)
        {
            throw new NotImplementedException();
        }
    }
}